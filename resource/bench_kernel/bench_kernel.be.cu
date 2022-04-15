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

__device__ void loop_device(float* __restrict__ n, float* __restrict__ b, float* __restrict__ temp){
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    for (int i = 0; i < n[0]; i++)
        temp[i % 1024] = i / (i + 1) * b[arrayOffset];
}


extern "C" __global__ void loop(int* preempted, int* task_slot, float* __restrict__ n, float* __restrict__ b, float* __restrict__ temp) {
    if (*preempted) return;
    loop_device(n, b, temp);
    if (threadIdx.x + threadIdx.y + threadIdx.z == 0)
        atomicAdd(task_slot, 1);
}        
