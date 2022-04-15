#pragma once
#include <cuda.h>
#include "reef/util/common.h"

#define GPUInit cuInit
#define GPUDeviceGet cuDeviceGet
#define GPUModuleLoad cuModuleLoad
#define GPUModuleGetFunction cuModuleGetFunction
#define GPUMalloc cuMemAlloc
#define GPUMemcpyHtoD cuMemcpyHtoD
#define GPUMemcpyDtoH cuMemcpyDtoH
#define GPUModuleLaunchKernel cuLaunchKernel
#define GPUStreamDefault 0
#define GPUStreamSynchronize cuStreamSynchronize
#define GPUStreamCreate cuStreamCreate
#define GPUStreamQuery cuStreamQuery
#define GPUStatusOK CUDA_SUCCESS
#define GPUFree cuMemFree
#define GPUWriteValue32Async cuStreamWriteValue32
#define GPUClearHostQueue cuStreamClearQueue
#define GPUResetCU cuResetWavefronts
#define GPUMemset cuMemsetD32

// #define GPU_RETURN_STATUS(cmd) return Status::Fail;

#define GPU_RETURN_STATUS(cmd) \
{\
    CUresult error = cmd;\
    if (error != CUDA_SUCCESS) {\
        const char* str;\
        cuGetErrorString(error, &str);\
        std::string err_str(str);\
        LOG(ERROR) << "cuda error: " << err_str << "at " << __FILE__ << ":" << __LINE__; \
        return Status::Fail;\
    }\
}

#define ASSERT_GPU_ERROR(cmd)\
{\
    CUresult error = cmd;\
    if (error != CUDA_SUCCESS) {\
        const char* str;\
        cuGetErrorString(error, &str);\
        std::string err_str(str);\
        LOG(ERROR) << "cuda error: " << err_str << "at " << __FILE__ << ":" << __LINE__; \
        exit(EXIT_FAILURE);\
    }\
}

struct dim3 {
    dim3(){}
    dim3(unsigned int _x, unsigned int _y, unsigned int _z) : x(_x), y(_y), z(_z) {}
    unsigned int x;
    unsigned int y;
    unsigned int z;
};

namespace reef {
namespace executor {

typedef CUdeviceptr GPUDevicePtr_t;
typedef CUfunction GPUFunction_t;
typedef CUdevice GPUDevice_t;
typedef CUmodule GPUModule_t;
typedef CUresult GPUError_t;
typedef CUstream GPUStream_t;

typedef unsigned long long int GPUFunctionPtr_t;

bool GPUStreamEmpty(GPUStream_t s);

class GPUConfig {
public:
    static uint32_t get_num_cus();
    static Status get_kernel_address(const char* name, GPUModule_t mod, GPUFunctionPtr_t& ret);

    struct KernelResource {
        int shared_memory;
        int vgprs;
        int sgprs;
        int stack_size;   
    };

    static Status get_kernel_resource(GPUFunction_t func, KernelResource& ret);

    static int calculate_occupancy(const KernelResource& resource, dim3 thread_idx);
};

} // namespace executor
} // namespace reef