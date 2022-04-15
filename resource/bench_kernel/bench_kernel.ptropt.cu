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

extern "C" __global__ void loop(float* __restrict__ n, float* __restrict__ b, float* __restrict__ temp) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
    int blockOffset = blockIdx.x;
    int blockSize = NUM_TREHAD_PER_BLOCK;
    int threadOffset = threadIdx.x + threadIdx.y * BLOCKDIM_X + threadIdx.z * BLOCKDIM_X * BLOCKDIM_Y;
    int arrayOffset = blockOffset * blockSize + threadOffset;

    for (int i = 0; i < n[0]; i++)
        temp[i % 1024] = i / (i + 1) * b[arrayOffset];
}


#define CALL_FRAMEWORK(idx) \
extern "C" __global__ void proxy_kernel_##idx(\
  void* func, float** param) \
{\
  asm volatile(\
    "  s_load_dwordx4 s[16:19], s[4:5], 0x0\n"\
    "  s_waitcnt lgkmcnt(0)\n"\
    "  s_mov_b64 s[4:5], s[18:19]\n"\
    "  s_setpc_b64 s[16:17]\n"\
    "  s_endpgm\n"\
  );\
}    

CALL_FRAMEWORK(1)
CALL_FRAMEWORK(2)
CALL_FRAMEWORK(3)
CALL_FRAMEWORK(4)
CALL_FRAMEWORK(5)
CALL_FRAMEWORK(6)
CALL_FRAMEWORK(7)
CALL_FRAMEWORK(8)
CALL_FRAMEWORK(9)
CALL_FRAMEWORK(10)
CALL_FRAMEWORK(nostack_1)
CALL_FRAMEWORK(nostack_2)
CALL_FRAMEWORK(nostack_3)
CALL_FRAMEWORK(nostack_4)
CALL_FRAMEWORK(nostack_5)
CALL_FRAMEWORK(nostack_6)
CALL_FRAMEWORK(nostack_7)
CALL_FRAMEWORK(nostack_8)
CALL_FRAMEWORK(nostack_9)
CALL_FRAMEWORK(nostack_10)
