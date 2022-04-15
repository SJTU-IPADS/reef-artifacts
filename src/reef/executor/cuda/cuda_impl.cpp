#include "reef/executor/cuda/cuda_impl.h"
#include "reef/util/common.h"

#include <glog/logging.h>

namespace reef {
namespace executor {

uint32_t GPUConfig::get_num_cus() {
    // TODO: dynamic load CU nums
    return 60;
}



Status GPUConfig::get_kernel_address(const char* name, GPUModule_t mod, GPUFunctionPtr_t& ret) {
    // hipFunction_t temp;
    // GPU_RETURN_STATUS(hipModuleGetFunction(&temp, mod, name));
    // hipFunctionWGInfo_t wgInfo;
    // GPU_RETURN_STATUS(hipFuncGetWGInfo(temp, &wgInfo));
    // hipDeviceptr_t temp_buf;
    // GPU_RETURN_STATUS(hipMalloc(&temp_buf, 64));
    // int buf[24];
    // int size = 24;

    // GPU_RETURN_STATUS(hipMemcpyDtoD(temp_buf, (hipDeviceptr_t)wgInfo.baseAddress, size));
    // GPU_RETURN_STATUS(hipMemcpy(buf, temp_buf, size, hipMemcpyDeviceToHost));
    // GPU_RETURN_STATUS(hipFree(temp_buf));

    // ret = wgInfo.baseAddress + *(long long int*)(&buf[4]);
    return Status::Succ;  
}

Status GPUConfig::get_kernel_resource(GPUFunction_t func, KernelResource& ret) {
    // hipFunctionWGInfo_t wg_info;
    // GPU_RETURN_STATUS(hipFuncGetWGInfo(func, &wg_info));
    // ret.shared_memory = wg_info.usedLDSSize_;
    // ret.vgprs = wg_info.usedVGPRs_;
    // ret.sgprs = wg_info.usedSGPRs_;
    // ret.stack_size = wg_info.privateMemSize_;
    return Status::Succ;
}

int GPUConfig::calculate_occupancy(const KernelResource& resource, dim3 block_dim) {
    int vgprs = align_up(resource.vgprs, 4);
    int sgprs = align_up(resource.sgprs, 8);
    int shared_mem = align_up(resource.shared_memory, 256);
    int block_size = (int)align_up<unsigned int>(block_dim.x * block_dim.y * block_dim.z, 64);

    int max_gpr_waves = (16 * 1024 / (vgprs * 64)) * 4;
    max_gpr_waves = std::min(max_gpr_waves, (800 / sgprs) * 4);
    max_gpr_waves = std::min(max_gpr_waves, 40);
    
    int max_gpr_blocks = max_gpr_waves * 64 / block_size;
    int max_shared_mem_blocks = 64 * 1024 / block_size;

    int max_thread_blocks = 2048 / block_size;
    
    int occupancy = std::min(max_gpr_blocks, max_shared_mem_blocks);
    occupancy = std::min(occupancy, max_thread_blocks);
    
    return occupancy;
}


bool GPUStreamEmpty(GPUStream_t s) {
    return cuStreamQuery(s) == CUDA_SUCCESS;
}


} // namespace executor
} // namespace reef