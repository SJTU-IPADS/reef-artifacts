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

__device__  void multiply_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp){
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = task_idx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] * b[arrayOffset];
}

__device__  void add_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ a, float* __restrict__ b, float* __restrict__ temp){
    __shared__ float buffer[1024 * 32 / 4];
    int blockOffset = task_idx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    temp[arrayOffset] = a[threadOffset] + b[arrayOffset];
}

extern "C" __global__ void multiply(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(64,1,1);
    dim3 thread_idx = dim3(threadIdx.x, threadIdx.y, threadIdx.z);
    __shared__ int idx[1];
    while (true) {
        if (*preempted) return;
        if (threadIdx.x + threadIdx.y + threadIdx.z == 0) {
            // first thread of the block
            int temp = atomicAdd(task_slot, 1);
            idx[0] = temp + task_offset;
        }
        __syncthreads();
        if (idx[0] >= task_num) return;
        dim3 task_idx = get_3d_idx(idx[0], task_dim);
        multiply_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void add(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(64,1,1);
    dim3 thread_idx = dim3(threadIdx.x, threadIdx.y, threadIdx.z);
    __shared__ int idx[1];
    while (true) {
        if (*preempted) return;
        if (threadIdx.x + threadIdx.y + threadIdx.z == 0) {
            // first thread of the block
            int temp = atomicAdd(task_slot, 1);
            idx[0] = temp + task_offset;
        }
        __syncthreads();
        if (idx[0] >= task_num) return;
        dim3 task_idx = get_3d_idx(idx[0], task_dim);
        add_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void preemption_proxy(volatile int* stop, volatile int* host, volatile int* device) {
    while(!(*stop)) {
        *device = *host;
        long long start_clock = clock64();
        while (clock64() < (start_clock+10000)) {}
    }
}
