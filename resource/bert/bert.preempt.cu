#include <hip/hip_runtime.h>

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

__device__  void fused_nn_softmax_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_softmax_maxelem, float* __restrict__ placeholder){
  if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 5760) {
    T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = -3.402823e+38f;
  }
  for (int k = 0; k < 480; ++k) {
    if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 5760) {
      T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = max(T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))], placeholder[((((((int)task_idx.x) * 122880) + (((int)threadIdx.x) * 480)) + k))]);
    }
  }
}

__device__  void fused_reshape_add_add_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_add, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ placeholder2){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_add[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = ((placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]) + placeholder2[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))]);
    }
  }
}

__device__  void fused_nn_batch_matmul_4_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute){
  float compute_local[8];
  __shared__ float placeholder_shared[720];
  __shared__ float placeholder_d_shared[300];
  float placeholder_shared_local[2];
  float placeholder_d_shared_local[4];
  for (int i_c_init = 0; i_c_init < 2; ++i_c_init) {
    for (int j_c_init = 0; j_c_init < 4; ++j_c_init) {
      compute_local[(((i_c_init * 4) + j_c_init))] = 0.000000e+00f;
    }
  }
  for (int k_outer = 0; k_outer < 32; ++k_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)))] = placeholder[((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)))];
    placeholder_shared[((((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)) + 1))] = placeholder[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 1))];
    placeholder_shared[((((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)) + 2))] = placeholder[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 2))];
    placeholder_shared[((((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)) + 15))] = placeholder[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 480))];
    placeholder_shared[((((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)) + 16))] = placeholder[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 481))];
    placeholder_shared[((((((int)threadIdx.y) * 30) + (((int)threadIdx.x) * 3)) + 17))] = placeholder[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 23040)) + (((int)threadIdx.y) * 960)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 482))];
    if (((int)threadIdx.y) < 20) {
      placeholder_d_shared[(((((int)threadIdx.y) * 15) + (((int)threadIdx.x) * 3)))] = placeholder1[((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 9600)) + (((int)threadIdx.y) * 480)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)))];
    }
    if (((int)threadIdx.y) < 20) {
      placeholder_d_shared[((((((int)threadIdx.y) * 15) + (((int)threadIdx.x) * 3)) + 1))] = placeholder1[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 9600)) + (((int)threadIdx.y) * 480)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 1))];
    }
    if (((int)threadIdx.y) < 20) {
      placeholder_d_shared[((((((int)threadIdx.y) * 15) + (((int)threadIdx.x) * 3)) + 2))] = placeholder1[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 9600)) + (((int)threadIdx.y) * 480)) + (k_outer * 15)) + (((int)threadIdx.x) * 3)) + 2))];
    }
    __syncthreads();
    for (int k_inner = 0; k_inner < 15; ++k_inner) {
      placeholder_shared_local[(0)] = placeholder_shared[(((((int)threadIdx.y) * 30) + k_inner))];
      placeholder_shared_local[(1)] = placeholder_shared[((((((int)threadIdx.y) * 30) + k_inner) + 15))];
      placeholder_d_shared_local[(0)] = placeholder_d_shared[(((((int)threadIdx.x) * 60) + k_inner))];
      placeholder_d_shared_local[(1)] = placeholder_d_shared[((((((int)threadIdx.x) * 60) + k_inner) + 15))];
      placeholder_d_shared_local[(2)] = placeholder_d_shared[((((((int)threadIdx.x) * 60) + k_inner) + 30))];
      placeholder_d_shared_local[(3)] = placeholder_d_shared[((((((int)threadIdx.x) * 60) + k_inner) + 45))];
      compute_local[(0)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(0)], compute_local[(0)]);
      compute_local[(1)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(1)], compute_local[(1)]);
      compute_local[(2)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(2)], compute_local[(2)]);
      compute_local[(3)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(3)], compute_local[(3)]);
      compute_local[(4)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(0)], compute_local[(4)]);
      compute_local[(5)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(1)], compute_local[(5)]);
      compute_local[(6)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(2)], compute_local[(6)]);
      compute_local[(7)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(3)], compute_local[(7)]);
    }
  }
  compute[((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)))] = compute_local[(0)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 1))] = compute_local[(1)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 2))] = compute_local[(2)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 3))] = compute_local[(3)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 40))] = compute_local[(4)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 41))] = compute_local[(5)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 42))] = compute_local[(6)];
  compute[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 1920)) + (((int)threadIdx.y) * 80)) + (((int)task_idx.x) * 20)) + (((int)threadIdx.x) * 4)) + 43))] = compute_local[(7)];
}

__device__  void fused_nn_batch_matmul_5_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute){
  float compute_local[15];
  __shared__ float placeholder_shared[800];
  __shared__ float placeholder_d_shared[480];
  float placeholder_shared_local[5];
  float placeholder_d_shared_local[3];
  for (int i_c_init = 0; i_c_init < 5; ++i_c_init) {
    for (int j_c_init = 0; j_c_init < 3; ++j_c_init) {
      compute_local[(((i_c_init * 3) + j_c_init))] = 0.000000e+00f;
    }
  }
  for (int k_outer = 0; k_outer < 4; ++k_outer) {
    __syncthreads();
    if (((int)threadIdx.x) < 10) {
      placeholder_shared[(((((int)threadIdx.y) * 50) + ((int)threadIdx.x)))] = placeholder[((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 3200)) + (((int)threadIdx.y) * 200)) + (k_outer * 10)) + ((int)threadIdx.x)))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_shared[((((((int)threadIdx.y) * 50) + ((int)threadIdx.x)) + 10))] = placeholder[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 3200)) + (((int)threadIdx.y) * 200)) + (k_outer * 10)) + ((int)threadIdx.x)) + 40))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_shared[((((((int)threadIdx.y) * 50) + ((int)threadIdx.x)) + 20))] = placeholder[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 3200)) + (((int)threadIdx.y) * 200)) + (k_outer * 10)) + ((int)threadIdx.x)) + 80))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_shared[((((((int)threadIdx.y) * 50) + ((int)threadIdx.x)) + 30))] = placeholder[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 3200)) + (((int)threadIdx.y) * 200)) + (k_outer * 10)) + ((int)threadIdx.x)) + 120))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_shared[((((((int)threadIdx.y) * 50) + ((int)threadIdx.x)) + 40))] = placeholder[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.y) * 3200)) + (((int)threadIdx.y) * 200)) + (k_outer * 10)) + ((int)threadIdx.x)) + 160))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_d_shared[(((((int)threadIdx.y) * 30) + ((int)threadIdx.x)))] = placeholder1[((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 1920)) + (((int)threadIdx.y) * 120)) + (k_outer * 10)) + ((int)threadIdx.x)))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_d_shared[((((((int)threadIdx.y) * 30) + ((int)threadIdx.x)) + 10))] = placeholder1[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 1920)) + (((int)threadIdx.y) * 120)) + (k_outer * 10)) + ((int)threadIdx.x)) + 40))];
    }
    if (((int)threadIdx.x) < 10) {
      placeholder_d_shared[((((((int)threadIdx.y) * 30) + ((int)threadIdx.x)) + 20))] = placeholder1[(((((((((int)task_idx.z) * 19200) + (((int)task_idx.x) * 1920)) + (((int)threadIdx.y) * 120)) + (k_outer * 10)) + ((int)threadIdx.x)) + 80))];
    }
    __syncthreads();
    for (int k_inner = 0; k_inner < 10; ++k_inner) {
      placeholder_shared_local[(0)] = placeholder_shared[(((((int)threadIdx.y) * 50) + k_inner))];
      placeholder_shared_local[(1)] = placeholder_shared[((((((int)threadIdx.y) * 50) + k_inner) + 10))];
      placeholder_shared_local[(2)] = placeholder_shared[((((((int)threadIdx.y) * 50) + k_inner) + 20))];
      placeholder_shared_local[(3)] = placeholder_shared[((((((int)threadIdx.y) * 50) + k_inner) + 30))];
      placeholder_shared_local[(4)] = placeholder_shared[((((((int)threadIdx.y) * 50) + k_inner) + 40))];
      placeholder_d_shared_local[(0)] = placeholder_d_shared[(((((int)threadIdx.x) * 30) + k_inner))];
      placeholder_d_shared_local[(1)] = placeholder_d_shared[((((((int)threadIdx.x) * 30) + k_inner) + 10))];
      placeholder_d_shared_local[(2)] = placeholder_d_shared[((((((int)threadIdx.x) * 30) + k_inner) + 20))];
      compute_local[(0)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(0)], compute_local[(0)]);
      compute_local[(1)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(1)], compute_local[(1)]);
      compute_local[(2)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(2)], compute_local[(2)]);
      compute_local[(3)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(0)], compute_local[(3)]);
      compute_local[(4)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(1)], compute_local[(4)]);
      compute_local[(5)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(2)], compute_local[(5)]);
      compute_local[(6)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(0)], compute_local[(6)]);
      compute_local[(7)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(1)], compute_local[(7)]);
      compute_local[(8)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(2)], compute_local[(8)]);
      compute_local[(9)] = __ocml_fma_f32(placeholder_shared_local[(3)], placeholder_d_shared_local[(0)], compute_local[(9)]);
      compute_local[(10)] = __ocml_fma_f32(placeholder_shared_local[(3)], placeholder_d_shared_local[(1)], compute_local[(10)]);
      compute_local[(11)] = __ocml_fma_f32(placeholder_shared_local[(3)], placeholder_d_shared_local[(2)], compute_local[(11)]);
      compute_local[(12)] = __ocml_fma_f32(placeholder_shared_local[(4)], placeholder_d_shared_local[(0)], compute_local[(12)]);
      compute_local[(13)] = __ocml_fma_f32(placeholder_shared_local[(4)], placeholder_d_shared_local[(1)], compute_local[(13)]);
      compute_local[(14)] = __ocml_fma_f32(placeholder_shared_local[(4)], placeholder_d_shared_local[(2)], compute_local[(14)]);
    }
  }
  compute[((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)))] = compute_local[(0)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1))] = compute_local[(1)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 2))] = compute_local[(2)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 480))] = compute_local[(3)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 481))] = compute_local[(4)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 482))] = compute_local[(5)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 960))] = compute_local[(6)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 961))] = compute_local[(7)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 962))] = compute_local[(8)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1440))] = compute_local[(9)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1441))] = compute_local[(10)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1442))] = compute_local[(11)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1920))] = compute_local[(12)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1921))] = compute_local[(13)];
  compute[(((((((((int)task_idx.z) * 230400) + (((int)task_idx.y) * 38400)) + (((int)threadIdx.y) * 2400)) + (((int)task_idx.x) * 48)) + (((int)threadIdx.x) * 3)) + 1922))] = compute_local[(14)];
}

__device__  void fused_nn_softmax_1_kernel1_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_softmax_exp, float* __restrict__ placeholder, float* __restrict__ T_softmax_maxelem){
  for (int i0_i1_fused_i2_fused_i3_fused_outer = 0; i0_i1_fused_i2_fused_i3_fused_outer < 43; ++i0_i1_fused_i2_fused_i3_fused_outer) {
    if ((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 2764800) {
      T_softmax_exp[((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = __ocml_exp_f32((placeholder[((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] - T_softmax_maxelem[(((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]));
    }
  }
}

__device__  void fused_reshape_add_multiply_erf_multiply_add_multiply_reshape_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_reshape, float* __restrict__ placeholder, float* __restrict__ placeholder1){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_reshape[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = ((placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]) * __ocml_fma_f32(__ocml_erf_f32(((placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]) * 7.071068e-01f)), 5.000000e-01f, 5.000000e-01f));
    }
  }
}

__device__  void fused_mean_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ placeholder, float* __restrict__ placeholder_red){
  float placeholder_red_rf[1];
  __shared__ float red_buf0[1024];
  placeholder_red_rf[(0)] = 0.000000e+00f;
  for (int k2_outer = 0; k2_outer < 15; ++k2_outer) {
    placeholder_red_rf[(0)] = (placeholder_red_rf[(0)] + placeholder[(((((((int)task_idx.x) * 15360) + (((int)threadIdx.y) * 480)) + (k2_outer * 32)) + ((int)threadIdx.x)))]);
  }
  __syncthreads();
  ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = placeholder_red_rf[(0)];
  __syncthreads();
  if (((int)threadIdx.x) < 16) {
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 16))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 8))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 4))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 2))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 1))]);
  }
  __syncthreads();
  if (((int)threadIdx.x) == 0) {
    placeholder_red[(((((int)task_idx.x) * 32) + ((int)threadIdx.y)))] = ((volatile float*)red_buf0)[((((int)threadIdx.y) * 32))];
  }
}

__device__  void fused_subtract_add_sqrt_divide_multiply_add_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_add, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ placeholder2, float* __restrict__ placeholder3, float* __restrict__ placeholder4){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_add[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = __ocml_fma_f32(((placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] - placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]) / __ocml_sqrt_f32((placeholder2[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))] + 1.000000e-12f))), placeholder3[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480))], placeholder4[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480))]);
    }
  }
}

__device__  void fused_nn_batch_matmul_3_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute){
  float compute_local[9];
  __shared__ float placeholder_shared[2400];
  __shared__ float placeholder_d_shared[300];
  float placeholder_shared_local[3];
  float placeholder_d_shared_local[3];
  for (int i_c_init = 0; i_c_init < 3; ++i_c_init) {
    for (int j_c_init = 0; j_c_init < 3; ++j_c_init) {
      compute_local[(((i_c_init * 3) + j_c_init))] = 0.000000e+00f;
    }
  }
  for (int k_outer = 0; k_outer < 24; ++k_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)))] = placeholder[(((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 1))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 1))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 2))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 2))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 3))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 3))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 20))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 480))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 21))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 481))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 22))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 482))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 23))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 483))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 40))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 960))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 41))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 961))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 42))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 962))];
    placeholder_shared[((((((int)threadIdx.y) * 60) + (((int)threadIdx.x) * 4)) + 43))] = placeholder[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 963))];
    if (((int)threadIdx.y) < 15) {
      placeholder_d_shared[(((((int)threadIdx.y) * 20) + (((int)threadIdx.x) * 4)))] = placeholder1[(((((((int)task_idx.x) * 7200) + (((int)threadIdx.y) * 480)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)))];
    }
    if (((int)threadIdx.y) < 15) {
      placeholder_d_shared[((((((int)threadIdx.y) * 20) + (((int)threadIdx.x) * 4)) + 1))] = placeholder1[((((((((int)task_idx.x) * 7200) + (((int)threadIdx.y) * 480)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 1))];
    }
    if (((int)threadIdx.y) < 15) {
      placeholder_d_shared[((((((int)threadIdx.y) * 20) + (((int)threadIdx.x) * 4)) + 2))] = placeholder1[((((((((int)task_idx.x) * 7200) + (((int)threadIdx.y) * 480)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 2))];
    }
    if (((int)threadIdx.y) < 15) {
      placeholder_d_shared[((((((int)threadIdx.y) * 20) + (((int)threadIdx.x) * 4)) + 3))] = placeholder1[((((((((int)task_idx.x) * 7200) + (((int)threadIdx.y) * 480)) + (k_outer * 20)) + (((int)threadIdx.x) * 4)) + 3))];
    }
    __syncthreads();
    for (int k_inner = 0; k_inner < 20; ++k_inner) {
      placeholder_shared_local[(0)] = placeholder_shared[(((((int)threadIdx.y) * 60) + k_inner))];
      placeholder_shared_local[(1)] = placeholder_shared[((((((int)threadIdx.y) * 60) + k_inner) + 20))];
      placeholder_shared_local[(2)] = placeholder_shared[((((((int)threadIdx.y) * 60) + k_inner) + 40))];
      placeholder_d_shared_local[(0)] = placeholder_d_shared[(((((int)threadIdx.x) * 60) + k_inner))];
      placeholder_d_shared_local[(1)] = placeholder_d_shared[((((((int)threadIdx.x) * 60) + k_inner) + 20))];
      placeholder_d_shared_local[(2)] = placeholder_d_shared[((((((int)threadIdx.x) * 60) + k_inner) + 40))];
      compute_local[(0)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(0)], compute_local[(0)]);
      compute_local[(1)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(1)], compute_local[(1)]);
      compute_local[(2)] = __ocml_fma_f32(placeholder_shared_local[(0)], placeholder_d_shared_local[(2)], compute_local[(2)]);
      compute_local[(3)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(0)], compute_local[(3)]);
      compute_local[(4)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(1)], compute_local[(4)]);
      compute_local[(5)] = __ocml_fma_f32(placeholder_shared_local[(1)], placeholder_d_shared_local[(2)], compute_local[(5)]);
      compute_local[(6)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(0)], compute_local[(6)]);
      compute_local[(7)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(1)], compute_local[(7)]);
      compute_local[(8)] = __ocml_fma_f32(placeholder_shared_local[(2)], placeholder_d_shared_local[(2)], compute_local[(8)]);
    }
  }
  compute[(((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)))] = compute_local[(0)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 1))] = compute_local[(1)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 2))] = compute_local[(2)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 480))] = compute_local[(3)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 481))] = compute_local[(4)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 482))] = compute_local[(5)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 960))] = compute_local[(6)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 961))] = compute_local[(7)];
  compute[((((((((int)task_idx.y) * 57600) + (((int)threadIdx.y) * 1440)) + (((int)task_idx.x) * 15)) + (((int)threadIdx.x) * 3)) + 962))] = compute_local[(8)];
}

__device__  void fused_reshape_5_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_reshape, float* __restrict__ placeholder){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 43; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 2764800) {
      T_reshape[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))];
    }
  }
}

__device__  void fused_reshape_transpose_copy_reshape_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_reshape, float* __restrict__ placeholder){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_reshape[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = placeholder[(((((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480) / 40) * 19200) + (((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480) * 40)) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 40)))];
    }
  }
}

__device__  void fused_reshape_add_reshape_transpose_reshape_transpose_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_transpose, float* __restrict__ placeholder, float* __restrict__ placeholder1){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_transpose[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = (placeholder[(((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480) * 480) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480))]);
    }
  }
}

__device__  void fused_reshape_add_reshape_transpose_transpose_reshape_transpose_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_transpose, float* __restrict__ placeholder, float* __restrict__ placeholder1){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_transpose[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = (placeholder[(((((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 19200) / 40) * 480) + (((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 19200) * 40)) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 40)))] + placeholder1[((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 19200) / 40))]);
    }
  }
}

__device__  void fused_reshape_add_reshape_transpose_divide_reshape_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_reshape, float* __restrict__ placeholder, float* __restrict__ placeholder1){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_reshape[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = ((placeholder[(((((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 19200) / 40) * 480) + (((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 19200) * 40)) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 40)))] + placeholder1[((((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 19200) / 40))]) * 1.581139e-01f);
    }
  }
}

__device__  void fused_full_equal_reshape_kernel0_device(dim3 task_idx, dim3 thread_idx, signed char* __restrict__ T_reshape){
  if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 480) {
    T_reshape[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = (signed char)0;
  }
}

__device__  void fused_cast_take_broadcast_to_like_cast_take_add_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_add, float* __restrict__ placeholder, long* __restrict__ placeholder1, float* __restrict__ placeholder2, long* __restrict__ placeholder3){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_add[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = (placeholder[(((min(max(0, ((int)placeholder1[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))])), 30521) * 480) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480)))] + placeholder2[(((min(max(0, ((int)placeholder3[(((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))])), 1023) * 480) + ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480)))]);
    }
  }
}

__device__  void fused_nn_softmax_1_kernel2_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_softmax_maxelem, float* __restrict__ T_softmax_exp){
  if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 5760) {
    T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = 0.000000e+00f;
  }
  for (int k = 0; k < 480; ++k) {
    if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 5760) {
      T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = (T_softmax_maxelem[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] + T_softmax_exp[((((((int)task_idx.x) * 122880) + (((int)threadIdx.x) * 480)) + k))]);
    }
  }
}

__device__  void fused_mean_1_kernel1_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_divide, float* __restrict__ placeholder_red){
  if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 480) {
    T_divide[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = (placeholder_red[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] * 2.083333e-03f);
  }
}

__device__  void fused_reshape_4_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_reshape, float* __restrict__ placeholder){
  for (int ax0_ax1_fused_ax2_fused_outer = 0; ax0_ax1_fused_ax2_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 230400) {
      T_reshape[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = placeholder[((((ax0_ax1_fused_ax2_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))];
    }
  }
}

__device__  void fused_variance_1_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_multiply_red){
  float T_multiply_red_rf[1];
  __shared__ float red_buf0[1024];
  T_multiply_red_rf[(0)] = 0.000000e+00f;
  for (int k2_outer = 0; k2_outer < 15; ++k2_outer) {
    T_multiply_red_rf[(0)] = __ocml_fma_f32((placeholder[(((((((int)task_idx.x) * 15360) + (((int)threadIdx.y) * 480)) + (k2_outer * 32)) + ((int)threadIdx.x)))] - placeholder1[(((((int)task_idx.x) * 32) + ((int)threadIdx.y)))]), (placeholder[(((((((int)task_idx.x) * 15360) + (((int)threadIdx.y) * 480)) + (k2_outer * 32)) + ((int)threadIdx.x)))] - placeholder1[(((((int)task_idx.x) * 32) + ((int)threadIdx.y)))]), T_multiply_red_rf[(0)]);
  }
  __syncthreads();
  ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = T_multiply_red_rf[(0)];
  __syncthreads();
  if (((int)threadIdx.x) < 16) {
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 16))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 8))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 4))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 2))]);
    ((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] = (((volatile float*)red_buf0)[(((((int)threadIdx.y) * 32) + ((int)threadIdx.x)))] + ((volatile float*)red_buf0)[((((((int)threadIdx.y) * 32) + ((int)threadIdx.x)) + 1))]);
  }
  __syncthreads();
  if (((int)threadIdx.x) == 0) {
    T_multiply_red[(((((int)task_idx.x) * 32) + ((int)threadIdx.y)))] = ((volatile float*)red_buf0)[((((int)threadIdx.y) * 32))];
  }
}

__device__  void fused_variance_1_kernel1_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_divide, float* __restrict__ T_multiply_red){
  if (((((int)task_idx.x) * 256) + ((int)threadIdx.x)) < 480) {
    T_divide[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] = (T_multiply_red[(((((int)task_idx.x) * 256) + ((int)threadIdx.x)))] * 2.083333e-03f);
  }
}

__device__  void fused_reshape_cast_broadcast_to_like_where_kernel0_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_where, signed char* __restrict__ placeholder, float* __restrict__ placeholder1){
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_outer = 0; ax0_ax1_fused_ax2_fused_ax3_fused_outer < 43; ++ax0_ax1_fused_ax2_fused_ax3_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 2764800) {
      T_where[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = ((((int)((bool)placeholder[(((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) % 480))])) != 0) ? -__int_as_float(0x7f800000) : placeholder1[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))]);
    }
  }
}

__device__  void fused_nn_softmax_1_kernel3_device(dim3 task_idx, dim3 thread_idx, float* __restrict__ T_softmax_norm, float* __restrict__ T_softmax_exp, float* __restrict__ T_softmax_maxelem){
  for (int i0_i1_fused_i2_fused_i3_fused_outer = 0; i0_i1_fused_i2_fused_i3_fused_outer < 43; ++i0_i1_fused_i2_fused_i3_fused_outer) {
    if ((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) < 2764800) {
      T_softmax_norm[((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] = (T_softmax_exp[((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)))] / T_softmax_maxelem[(((((i0_i1_fused_i2_fused_i3_fused_outer * 65536) + (((int)task_idx.x) * 256)) + ((int)threadIdx.x)) / 480))]);
    }
  }
}


extern "C" __global__ void fused_nn_softmax_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(23,1,1);
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
        fused_nn_softmax_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_reshape_add_add_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_add_add_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2], (float* __restrict__)args[3]);
    }
}

extern "C" __global__ void fused_nn_batch_matmul_4_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(2,10,12);
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
        fused_nn_batch_matmul_4_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_nn_batch_matmul_5_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(10,6,12);
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
        fused_nn_batch_matmul_5_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_nn_softmax_1_kernel1(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_nn_softmax_1_kernel1_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_reshape_add_multiply_erf_multiply_add_multiply_reshape_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_add_multiply_erf_multiply_add_multiply_reshape_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_mean_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(15,1,1);
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
        fused_mean_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_subtract_add_sqrt_divide_multiply_add_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_subtract_add_sqrt_divide_multiply_add_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2], (float* __restrict__)args[3], (float* __restrict__)args[4], (float* __restrict__)args[5]);
    }
}

extern "C" __global__ void fused_nn_batch_matmul_3_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(32,4,1);
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
        fused_nn_batch_matmul_3_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_reshape_5_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_5_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_reshape_transpose_copy_reshape_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_transpose_copy_reshape_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_reshape_add_reshape_transpose_reshape_transpose_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_add_reshape_transpose_reshape_transpose_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_reshape_add_reshape_transpose_transpose_reshape_transpose_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_add_reshape_transpose_transpose_reshape_transpose_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_reshape_add_reshape_transpose_divide_reshape_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_add_reshape_transpose_divide_reshape_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_full_equal_reshape_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(2,1,1);
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
        fused_full_equal_reshape_kernel0_device(task_idx, thread_idx, (signed char* __restrict__)args[0]);
    }
}

extern "C" __global__ void fused_cast_take_broadcast_to_like_cast_take_add_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_cast_take_broadcast_to_like_cast_take_add_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (long* __restrict__)args[2], (float* __restrict__)args[3], (long* __restrict__)args[4]);
    }
}

extern "C" __global__ void fused_nn_softmax_1_kernel2(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(23,1,1);
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
        fused_nn_softmax_1_kernel2_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_mean_1_kernel1(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(2,1,1);
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
        fused_mean_1_kernel1_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_reshape_4_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_4_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_variance_1_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(15,1,1);
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
        fused_variance_1_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_variance_1_kernel1(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(2,1,1);
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
        fused_variance_1_kernel1_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1]);
    }
}

extern "C" __global__ void fused_reshape_cast_broadcast_to_like_where_kernel0(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_reshape_cast_broadcast_to_like_where_kernel0_device(task_idx, thread_idx, (float* __restrict__)args[0], (signed char* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void fused_nn_softmax_1_kernel3(volatile int* preempted, int task_num, int task_offset, int* task_slot, float** args) {
    dim3 task_dim = dim3(256,1,1);
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
        fused_nn_softmax_1_kernel3_device(task_idx, thread_idx, (float* __restrict__)args[0], (float* __restrict__)args[1], (float* __restrict__)args[2]);
    }
}

extern "C" __global__ void preemption_proxy(volatile int* stop, volatile int* host, volatile int* device) {
    while(!(*stop)) {
        *device = *host;
        long long start_clock = clock64();
        while (clock64() < (start_clock+10000)) {}
    }
}
