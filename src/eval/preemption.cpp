// #include "PreemptableExecutor.h"
// #include "HybridModelExecutor.h"
#include "reef/executor/hybrid_executor.h"
#include <map>
#include <algorithm>

using namespace reef::executor;

int main(int argc, char** argv) {
    if (argc != 5) {
        std::cout << "usage: ./preemption resource_dir model concurrency [wait|reset]" << std::endl;
        exit(1);
    }

    std::string resource_dir(argv[1]);
    std::string model_name(argv[2]);
    int concurrency = atoi(argv[3]);
    std::string method(argv[4]);

    if (method != "block" && method != "thread") {
        std::cout << "unknown method: " << method << std::endl;
        exit(1);
    }

    std::string    rt_mod_path = std::string(resource_dir) + "/" + model_name + ".trans.co";
    std::string    be_mod_path = std::string(resource_dir) + "/" + model_name + ".be.co";
    std::string    json_file_path = std::string(resource_dir) + "/" + model_name + ".json";
    std::string    profile_file_path = std::string(resource_dir) + "/" + model_name + ".profile.json";
    std::vector<HybridExecutor*> executors;
    executors.resize(concurrency);

    int num_tests = 500;

    hipStream_t preempt_stream;
    hipDeviceptr_t preempt_flag;

    // ASSERT_GPU_ERROR(hipMallocManaged(&preempt_flag, 64));
    ASSERT_GPU_ERROR(hipMalloc(&preempt_flag, 64));
    ASSERT_GPU_ERROR(hipStreamCreateWithPriority(&preempt_stream, 0, -1));

    for (int j = 0; j < concurrency; j++) {
        HybridExecutor* executor = new HybridExecutor();
        executor->load_hybrid_model_from_file(
            json_file_path.c_str(), 
            profile_file_path.c_str(), 
            rt_mod_path.c_str(),
            be_mod_path.c_str() 
        );
        executors[j] = executor;
        executor->set_preempt_flag(preempt_flag);
        hipStream_t stream;
        int window_size = 2;
        if (method == "block")
            window_size = 1024;
        ASSERT_GPU_ERROR(hipStreamCreateWithWindowSize(&stream, window_size));
        executor->set_stream(stream);

    }
    int sum = 0;

    std::vector<int64_t> res;
    std::vector<int64_t> reset_host, reset_wave, reset_device;

    for (int i = 0; i < num_tests; i++) {
        ASSERT_GPU_ERROR(hipDeviceSynchronize());
        ASSERT_GPU_ERROR(hipMemset(preempt_flag, 0, 4));
        ASSERT_GPU_ERROR(hipDeviceSynchronize());
        for (int j = 0; j < concurrency; j++) 
            executors[j]->execute_preemptale(executors[j]->stream());
            // for (int k = 0; k < executors[j]->num_kernels(); k++)
            //     executors[j]->launch_preempt_kernel(k, executors[j]->stream());
        usleep((random() % 1000));
        auto start = std::chrono::system_clock::now();
        if (method == "block") {
            int value = 1;
            ASSERT_GPU_ERROR(hipStreamWriteValue32(preempt_stream, preempt_flag, 1, 0));
            // ASSERT_GPU_ERROR(hipMemcpyHtoDAsync(preempt_flag, &value, 4, preempt_stream));
            ASSERT_GPU_ERROR(hipDeviceSynchronize());
        } else {
            int value = 1;
            uint64_t tmp;
            for (int j = 0; j < concurrency; j++) 
                ASSERT_GPU_ERROR(hipStreamClearQueue(&tmp, executors[j]->stream()));
            auto part1 = std::chrono::system_clock::now();
            ASSERT_GPU_ERROR(hipStreamWriteValue32(preempt_stream, preempt_flag, 1, 0));
            // while (hipStreamQuery(preempt_stream) != hipSuccess)
            //     ASSERT_GPU_ERROR(hipResetWavefronts());
            // ASSERT_GPU_ERROR(hipStreamSynchronize(preempt_stream));
            // for (int j = 0; j < concurrency; j++) 
            //     ASSERT_GPU_ERROR(hipResetWavefronts());
            // ASSERT_GPU_ERROR(hipDeviceSynchronize());
            ASSERT_GPU_ERROR(hipResetWavefronts());
            auto part2 = std::chrono::system_clock::now();
            for (int j = 0; j < concurrency; j++) {
                while (hipStreamQuery(executors[j]->stream()) != hipSuccess) {
                    ASSERT_GPU_ERROR(hipResetWavefronts());
                    sched_yield();
                }
            }
            auto end = std::chrono::system_clock::now();
            reset_host.push_back(std::chrono::duration_cast<std::chrono::microseconds>(part1 - start).count());
            reset_wave.push_back(std::chrono::duration_cast<std::chrono::microseconds>(part2 - part1).count());
            reset_device.push_back(std::chrono::duration_cast<std::chrono::microseconds>(end - part2).count());
            
            // std::cout << std::chrono::duration_cast<std::chrono::microseconds>(part1 - start).count()
            //           << "," << std::chrono::duration_cast<std::chrono::microseconds>(part2 - part1).count()
            //           << "," << std::chrono::duration_cast<std::chrono::microseconds>(end - part2).count() << std::endl;
        }
        auto end = std::chrono::system_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
        // std::cout << duration << std::endl;
        // sum += duration;
        res.push_back(duration);
    }

    std::sort(res.begin(), res.end());

    if (method == "thread") {
        std::sort(reset_host.begin(), reset_host.end());
        std::sort(reset_device.begin(), reset_device.end());
        std::sort(reset_wave.begin(), reset_wave.end());
        std::cerr << "reset_host: " << reset_host[num_tests/2] << std::endl;
        std::cerr << "reset_dev : " << reset_device[num_tests/2] << std::endl;
        std::cerr << "reset_wave: " << reset_wave[num_tests/2] << std::endl;
    } else {
        int64_t sum = 0;
        for (auto s : res) sum += s;
        std::cerr << "median: " <<  res[num_tests/2] << ", mean: " << sum << std::endl;
    }
    return 0;
}