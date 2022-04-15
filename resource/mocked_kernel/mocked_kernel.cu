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

extern "C" __global__ void multiply(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp) {
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] * b[arrayOffset];
}

extern "C" __global__ void add(float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp) {
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] + b[arrayOffset];
}
