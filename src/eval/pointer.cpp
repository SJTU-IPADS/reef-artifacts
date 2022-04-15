#include "reef/executor/hybrid_executor.h"

using namespace reef;

namespace reef {
namespace executor {

class OverAllocExecutor : public TransExecutor {
public:
    Status load_model_from_GPU_module(const char* json_file_path, GPUModule_t module) override {
        Status ret = init_executor_base(json_file_path, module);
        if (ret != Status::Succ) return ret;
        RETURN_STATUS(init_rt_executor(json_file_path, module));

        call_kernels.resize(10);
        for (size_t i = 0; i < 10; i++) {
            std::stringstream kernel_name;
            kernel_name << "call_framework_" << (i+1);
            hipFunction_t call_framework;
            GPU_RETURN_STATUS(hipModuleGetFunction(&call_framework, module, kernel_name.str().c_str()));
            call_kernels[i] = call_framework;
        }

        return Status::Succ;
    }  
protected:
    std::vector<hipFunction_t> call_kernels;

    virtual Status launch_kernel(int kernel_offset, GPUStream_t stream) override {
        auto arg = trans_args[kernel_offset];
        int proxy_kernel_idx = align_up<int>(arg.thread_dim.x * arg.thread_dim.y * arg.thread_dim.z, 256) / 256;
        hipFunction_t proxy_kernel = call_kernels[proxy_kernel_idx - 1];
        
        void *args[] = {
            &arg.funcion_pointer,
            &arg.min_occupancy,
            &arg.block_num,
            &arg.block_offset,
            &arg.args,

            &arg.funcion_pointer,
            &arg.min_occupancy,
            &arg.block_num,
            &arg.block_offset,
            &arg.args,
            
            &arg.cu_upper
        };
        GPU_RETURN_STATUS(hipModuleLaunchKernel(
            proxy_kernel, 
            arg.min_occupancy * GPUConfig::get_num_cus(), 1, 1,
            arg.thread_dim.x * arg.thread_dim.y * arg.thread_dim.z, 1, 1,
            arg.resource.shared_memory, stream, args, 0
        ));
        return Status::Succ;
    }

};

class PointerExecutor : public TransExecutor {
public:
    Status load_model_from_GPU_module(const char* json_file_path, GPUModule_t module) override {
        Status ret = init_executor_base(json_file_path, module);
        if (ret != Status::Succ) return ret;
        return init_rt_executor(json_file_path, module);
    }

protected:
    virtual std::string REEF_PROXY_KERNEL_PREFIX() const override {
        return "proxy_kernel_";
    } 
    virtual std::string REEF_PROXY_KERNEL_NOSTACK_PREFIX() const override {
        return "proxy_kernel_nostack_";
    }
    virtual Status launch_kernel(int kernel_offset, GPUStream_t stream) override {
        auto arg = trans_args[kernel_offset];
        int proxy_kernel_idx = align_up<int>(arg.thread_dim.x * arg.thread_dim.y * arg.thread_dim.z, 256) / 256;
        hipFunction_t proxy_kernel = get_proxy_kernel(arg.resource); 
        void *args[] = {
            &arg.funcion_pointer,
            &arg.args
        };
        GPU_RETURN_STATUS(hipModuleLaunchKernel(
            proxy_kernel, 
            arg.task_dim.x, arg.task_dim.y, arg.task_dim.z,
            arg.thread_dim.x, arg.thread_dim.y, arg.thread_dim.z,
            arg.resource.shared_memory, stream, args, 0
        ));
        return Status::Succ;
    }
};

}
}


int main(int argc, char* argv[]) {
    if (argc != 4) {
        std::cout << "usage: pointer_overhead model_name [raw|under|over|dyn] num_test\n";
    }

    std::string resource_dir(RESOURCE_DIR);
    std::string model_name(argv[1]);
    std::string method(argv[2]);
    std::string prefix = resource_dir + "/" + model_name + "/" + model_name;
    int num_test = std::atoi(argv[3]);
    executor::ExecutorBase *exe;
    if (method == "raw") {
        exe = new executor::ExecutorBase();
        ASSERT_STATUS(exe->load_model_from_file(
            (prefix + ".json").c_str(),
            (prefix + ".raw.co").c_str()
        ));
    } else if (method == "under") {
        exe = new executor::ExecutorBase();
        ASSERT_STATUS(exe->load_model_from_file(
            (prefix + ".json").c_str(),
            (prefix + ".pointer.co").c_str()
        ));
    } else if (method == "over") {
        exe = new executor::OverAllocExecutor();
        ASSERT_STATUS(exe->load_model_from_file(
            (prefix + ".json").c_str(),
            (prefix + ".trans.co").c_str()
        ));
    } else if (method == "dyn") {
        exe = new executor::PointerExecutor();
        ASSERT_STATUS(exe->load_model_from_file(
            (prefix + ".json").c_str(),
            (prefix + ".ptropt.co").c_str()
        ));
    } else {
        std::cout << "unknown method: " << method << std::endl;
        return 0;
    }
    
    exe->execute(); // warm up
    float sum = 0;
    // int num_test = 100;
    for (int i = 0; i < num_test; i++) {
        auto start = std::chrono::system_clock::now();
        exe->execute();
        auto end = std::chrono::system_clock::now();
        float latency = (float)std::chrono::duration_cast<std::chrono::microseconds>(end-start).count() / 1000.0;
        sum += latency;
    }
    std::cout << "latency: " << sum / num_test << " ms\n";
    return 0;
}