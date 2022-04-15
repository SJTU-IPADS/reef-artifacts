#include <hip/hip_runtime.h>
#define __shfl_sync(mask, var, lane, width) \
        __shfl((var), (lane), (width))

#define __shfl_down_sync(mask, var, offset, width) \
        __shfl_down((var), (offset), (width))

#define __shfl_up_sync(mask, var, offset, width) \
        __shfl_up((var), (offset), (width))


#define NUM_BLOCKS 64
#define NUM_TREHAD_PER_BLOCK 128
#define BLOCKDIM_X 4
#define BLOCKDIM_Y 8
#define BLOCKDIM_Z 4

#define __activemask() 0

#define CU_NUM 60

__device__ __forceinline__ bool is_first_thread() {
  return threadIdx.x == 0;
}

__device__ __forceinline__ unsigned int get_cu_id() {
  return blockIdx.x % CU_NUM;
}

__device__ __forceinline__ dim3 get_3d_idx(int idx, dim3 dim) {
  dim3 result;
  result.x = idx % dim.x;
  result.y = idx / dim.x % dim.y;
  result.z = idx / (dim.x * dim.y);
  return result;
}

__device__ __noinline__ void multiply_device(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp){
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] * b[arrayOffset];
}

__device__ __noinline__ void add_device(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp){
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] + b[arrayOffset];
}

extern "C" __global__ __attribute__((amdgpu_num_vgpr(24))) __attribute__((amdgpu_num_sgpr(30)))void multiply(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp) {
    multiply_device(a, b, temp);
}

extern "C" __global__ __attribute__((amdgpu_num_vgpr(24))) __attribute__((amdgpu_num_sgpr(30)))void add(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp) {
    add_device(a, b, temp);
}

extern "C" __global__ void _get_func_pointers(unsigned long long int *address) {
    address[0] = (unsigned long long int)&add_device;
    address[1] = (unsigned long long int)&multiply_device;

}

