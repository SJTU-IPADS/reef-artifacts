#include <hip/hip_runtime.h>
#define __ocml_fma_f32(a,b,c) a*b+c
extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_2_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps) < 29)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu) < 29)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (eps * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + nu) - 29))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 100352) + (nu1 * 25088)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 24576))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 98304))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 122880))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      if (((((((int)threadIdx.x) & 15) >> 2) * 2) + ax2_inner) < 7) {
        if ((((((int)threadIdx.x) & 3) * 2) + ax3_inner) < 7) {
          T_relu[(((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (ax2_inner * 7)) + ((((int)threadIdx.x) & 3) * 2)) + ax3_inner))] = max((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[(((((int)blockIdx.x) * 8) + (((int)threadIdx.x) >> 4)))]), 0.000000e+00f);
        }
      }
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_2_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[8];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[3136];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(4)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(6)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(5)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  bgemm_local[(7)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    if (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) < 512) {
      if (((int)threadIdx.y) < 6) {
        placeholder_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 16384) + (ci_outer * 2048)) + ((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) >> 5) * 128)) + (((int)blockIdx.y) * 32)) + (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) & 31)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 1568))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 1568))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 2352))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 2352))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(7)]);
  }
  bgemm[(((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3136))] = bgemm_local[(4)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3234))] = bgemm_local[(6)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 196))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3332))] = bgemm_local[(5)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 294))] = bgemm_local[(3)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3430))] = bgemm_local[(7)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_1_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (ax2_inner * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + ax3_inner))] = max(((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (ax2_inner * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + ax3_inner))]) + placeholder1[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 196))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_2_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[8];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[3136];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(4)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(6)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(5)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  bgemm_local[(7)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    if (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) < 512) {
      if (((int)threadIdx.y) < 6) {
        placeholder_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 16384) + (ci_outer * 2048)) + ((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) >> 5) * 128)) + (((int)blockIdx.y) * 32)) + (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) & 31)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 1568))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 1568))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 2352))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 2352))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(7)]);
  }
  bgemm[(((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3136))] = bgemm_local[(4)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3234))] = bgemm_local[(6)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 196))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3332))] = bgemm_local[(5)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 294))] = bgemm_local[(3)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3430))] = bgemm_local[(7)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[1024];
  __shared__ float data_pack_shared[256];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 32; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 256))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 2048))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 512))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 4096))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 768))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 6144))];
    data_pack_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 8192) + (ci_outer * 256)) + (((int)threadIdx.y) * 8)) + ((int)threadIdx.x)))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 16))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 17))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_1_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[8];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[3136];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(4)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(6)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(5)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  bgemm_local[(7)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    if (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) < 512) {
      if (((int)threadIdx.y) < 6) {
        placeholder_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 16384) + (ci_outer * 2048)) + ((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) >> 5) * 128)) + (((int)blockIdx.y) * 32)) + (((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) & 31)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 98) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 1568))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 1568))];
    data_pack_shared[((((((int)threadIdx.y) * 98) + ((int)threadIdx.x)) + 2352))] = data_pack[((((((((int)blockIdx.z) * 25088) + (ci_outer * 3136)) + (((int)threadIdx.y) * 98)) + ((int)threadIdx.x)) + 2352))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 16))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 17))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 32))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 48))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 33))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 49))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 80))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 81))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 96))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 112))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 97))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 113))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 144))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 145))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 160))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 176))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 161))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 177))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 208))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 209))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 224))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 240))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 225))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 241))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 272))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1568))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 273))], data_pack_shared[((((int)threadIdx.x) + 1666))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 288))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 304))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1764))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 289))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 305))], data_pack_shared[((((int)threadIdx.x) + 1862))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 336))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 1960))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 337))], data_pack_shared[((((int)threadIdx.x) + 2058))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 352))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 368))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2156))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 353))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 369))], data_pack_shared[((((int)threadIdx.x) + 2254))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 400))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2352))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 401))], data_pack_shared[((((int)threadIdx.x) + 2450))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 416))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 432))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2548))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 417))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 433))], data_pack_shared[((((int)threadIdx.x) + 2646))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 464))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2744))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 465))], data_pack_shared[((((int)threadIdx.x) + 2842))], bgemm_local[(7)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(0)]);
    bgemm_local[(4)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(4)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 480))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(2)]);
    bgemm_local[(6)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 496))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(6)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(1)]);
    bgemm_local[(5)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 2940))], bgemm_local[(5)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 481))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(3)]);
    bgemm_local[(7)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 497))], data_pack_shared[((((int)threadIdx.x) + 3038))], bgemm_local[(7)]);
  }
  bgemm[(((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3136))] = bgemm_local[(4)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3234))] = bgemm_local[(6)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 196))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3332))] = bgemm_local[(5)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 294))] = bgemm_local[(3)];
  bgemm[((((((((int)blockIdx.z) * 25088) + (((int)blockIdx.y) * 6272)) + (((int)threadIdx.y) * 392)) + ((int)threadIdx.x)) + 3430))] = bgemm_local[(7)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((int)threadIdx.x) & 15) >> 2) * 2) + eps)) && (((((((int)threadIdx.x) & 15) >> 2) * 2) + eps) < 8)) && (1 <= (((((int)threadIdx.x) & 3) * 2) + nu))) && ((((((int)threadIdx.x) & 3) * 2) + nu) < 8)) ? placeholder[((((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (eps * 7)) + ((((int)threadIdx.x) & 3) * 2)) + nu) - 8))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 32768) + (nu1 * 8192)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_softmax_kernel0(float* __restrict__ placeholder, float* __restrict__ T_softmax_norm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float normal_reduce_temp0[1];
  float red_buf0[1];
  float T_softmax_exp[16];
  float normal_reduce_temp01[1];
  float red_buf01[1];
  normal_reduce_temp0[(0)] = -3.402823e+38f;
  for (int k_inner = 0; k_inner < 16; ++k_inner) {
    if (((((int)threadIdx.x) * 16) + k_inner) < 1000) {
      normal_reduce_temp0[(0)] = max(normal_reduce_temp0[(0)], placeholder[(((((int)threadIdx.x) * 16) + k_inner))]);
    }
  }
  unsigned int mask[1];
  float t0[1];
  red_buf0[(0)] = normal_reduce_temp0[(0)];
  ((int*)mask)[(0)] = 0;
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 32) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 32)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 16) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 16)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 8) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 8)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 4) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 4)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 2) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 2)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 1) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 1)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = max(red_buf0[(0)], t0[(0)]);
  red_buf0[(0)] = __hip_ds_bpermutef(((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & (~63)) << 2), red_buf0[(0)]);
  for (int i1_inner_outer = 0; i1_inner_outer < 4; ++i1_inner_outer) {
    for (int i1_inner_inner_s = 0; i1_inner_inner_s < 4; ++i1_inner_inner_s) {
      if ((((((int)threadIdx.x) * 16) + (i1_inner_outer * 4)) + i1_inner_inner_s) < 1000) {
        T_softmax_exp[(((i1_inner_outer * 4) + i1_inner_inner_s))] = __ocml_exp_f32((placeholder[((((((int)threadIdx.x) * 16) + (i1_inner_outer * 4)) + i1_inner_inner_s))] - red_buf0[(0)]));
      }
    }
  }
  normal_reduce_temp01[(0)] = 0.000000e+00f;
  for (int k_inner1 = 0; k_inner1 < 16; ++k_inner1) {
    if (((((int)threadIdx.x) * 16) + k_inner1) < 1000) {
      normal_reduce_temp01[(0)] = (normal_reduce_temp01[(0)] + __hip_ds_bpermutef(((((int)threadIdx.x) + (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & (~63))) << 2), T_softmax_exp[(k_inner1)]));
    }
  }
  unsigned int mask1[1];
  float t01[1];
  red_buf01[(0)] = normal_reduce_temp01[(0)];
  ((int*)mask1)[(0)] = 0;
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 32) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 32)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 16) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 16)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 8) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 8)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 4) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 4)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 2) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 2)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  t01[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 1) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 1)) << 2), red_buf01[(0)]);
  red_buf01[(0)] = (red_buf01[(0)] + t01[(0)]);
  red_buf01[(0)] = __hip_ds_bpermutef(((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & (~63)) << 2), red_buf01[(0)]);
  for (int i1_inner_outer1 = 0; i1_inner_outer1 < 4; ++i1_inner_outer1) {
    for (int i1_inner_inner_s1 = 0; i1_inner_inner_s1 < 4; ++i1_inner_inner_s1) {
      if ((((((int)threadIdx.x) * 16) + (i1_inner_outer1 * 4)) + i1_inner_inner_s1) < 1000) {
        T_softmax_norm[((((((int)threadIdx.x) * 16) + (i1_inner_outer1 * 4)) + i1_inner_inner_s1))] = (__hip_ds_bpermutef(((((int)threadIdx.x) + (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & (~63))) << 2), T_softmax_exp[(((i1_inner_outer1 * 4) + i1_inner_inner_s1))]) / red_buf01[(0)]);
      }
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_2_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[36];
  float data_pack_local[36];
  for (int eps = 0; eps < 6; ++eps) {
    for (int nu = 0; nu < 6; ++nu) {
      d[(((eps * 6) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps) < 57)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu) < 57)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (eps * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + nu) - 57))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(1)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(3)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(4)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(6)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(12)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(18)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(24)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(28)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(2)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(3)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(4)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(25)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(28)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(2)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(3)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(4)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(28)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(3)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(4)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(28)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(1)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(3)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(28)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(1)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(2)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(3)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(4)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(10)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(11)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(16)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(17)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(22)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(23)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(25)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(29)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(12)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(18)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(24)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(28)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(10)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(25)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(28)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(10)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(28)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(28)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(28)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(16)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(17)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(22)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(23)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(25)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(29)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(12)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(18)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(24)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(28)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(25)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(28)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(28)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(28)]);
  data_pack_local[(16)] = 0.000000e+00f;
  data_pack_local[(16)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = (data_pack_local[(16)] + d[(28)]);
  data_pack_local[(17)] = 0.000000e+00f;
  data_pack_local[(17)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(16)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(17)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(22)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(23)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(25)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(29)]);
  data_pack_local[(18)] = 0.000000e+00f;
  data_pack_local[(18)] = __ocml_fma_f32(d[(6)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(18)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(24)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(28)]);
  data_pack_local[(19)] = 0.000000e+00f;
  data_pack_local[(19)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(25)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(28)]);
  data_pack_local[(20)] = 0.000000e+00f;
  data_pack_local[(20)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = (data_pack_local[(20)] + d[(28)]);
  data_pack_local[(21)] = 0.000000e+00f;
  data_pack_local[(21)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = (data_pack_local[(21)] + d[(28)]);
  data_pack_local[(22)] = 0.000000e+00f;
  data_pack_local[(22)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = (data_pack_local[(22)] + d[(28)]);
  data_pack_local[(23)] = 0.000000e+00f;
  data_pack_local[(23)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(10)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(11)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(22)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(23)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(25)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(29)]);
  data_pack_local[(24)] = 0.000000e+00f;
  data_pack_local[(24)] = __ocml_fma_f32(d[(6)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(18)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(28)]);
  data_pack_local[(25)] = 0.000000e+00f;
  data_pack_local[(25)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(28)]);
  data_pack_local[(26)] = 0.000000e+00f;
  data_pack_local[(26)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = (data_pack_local[(26)] + d[(28)]);
  data_pack_local[(27)] = 0.000000e+00f;
  data_pack_local[(27)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = (data_pack_local[(27)] + d[(28)]);
  data_pack_local[(28)] = 0.000000e+00f;
  data_pack_local[(28)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = (data_pack_local[(28)] + d[(28)]);
  data_pack_local[(29)] = 0.000000e+00f;
  data_pack_local[(29)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(10)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(11)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(22)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(23)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(25)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(29)]);
  data_pack_local[(30)] = 0.000000e+00f;
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(6)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(10)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(12)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(18)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(24)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(31)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(32)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(33)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(34)]);
  data_pack_local[(31)] = 0.000000e+00f;
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(7)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(10)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(32)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(33)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(34)]);
  data_pack_local[(32)] = 0.000000e+00f;
  data_pack_local[(32)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(10)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(31)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(32)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(33)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(34)]);
  data_pack_local[(33)] = 0.000000e+00f;
  data_pack_local[(33)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(10)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(31)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(33)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(34)]);
  data_pack_local[(34)] = 0.000000e+00f;
  data_pack_local[(34)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(10)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(31)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(33)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(34)]);
  data_pack_local[(35)] = 0.000000e+00f;
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(7)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(11)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(16)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(17)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(22)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(23)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(28)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(29)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(31)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(32)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(33)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(34)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(35)]);
  for (int eps1 = 0; eps1 < 6; ++eps1) {
    for (int nu1 = 0; nu1 < 6; ++nu1) {
      data_pack[(((((eps1 * 75264) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 6) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_3_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[36];
  float data_pack_local[36];
  for (int eps = 0; eps < 6; ++eps) {
    for (int nu = 0; nu < 6; ++nu) {
      d[(((eps * 6) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps) < 57)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu) < 57)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (eps * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + nu) - 57))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(1)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(3)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(4)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(6)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(12)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(18)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(24)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(28)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(2)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(3)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(4)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(25)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(28)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(2)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(3)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(4)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(28)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(3)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(4)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(28)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(1)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(3)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(28)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(1)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(2)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(3)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(4)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(10)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(11)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(16)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(17)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(22)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(23)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(25)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(29)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(12)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(18)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(24)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(28)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(10)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(25)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(28)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(10)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(28)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(28)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(28)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(16)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(17)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(22)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(23)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(25)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(29)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(12)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(18)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(24)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(28)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(25)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(28)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(28)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(28)]);
  data_pack_local[(16)] = 0.000000e+00f;
  data_pack_local[(16)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = (data_pack_local[(16)] + d[(28)]);
  data_pack_local[(17)] = 0.000000e+00f;
  data_pack_local[(17)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(16)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(17)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(22)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(23)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(25)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(29)]);
  data_pack_local[(18)] = 0.000000e+00f;
  data_pack_local[(18)] = __ocml_fma_f32(d[(6)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(18)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(24)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(28)]);
  data_pack_local[(19)] = 0.000000e+00f;
  data_pack_local[(19)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(25)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(28)]);
  data_pack_local[(20)] = 0.000000e+00f;
  data_pack_local[(20)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = (data_pack_local[(20)] + d[(28)]);
  data_pack_local[(21)] = 0.000000e+00f;
  data_pack_local[(21)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = (data_pack_local[(21)] + d[(28)]);
  data_pack_local[(22)] = 0.000000e+00f;
  data_pack_local[(22)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = (data_pack_local[(22)] + d[(28)]);
  data_pack_local[(23)] = 0.000000e+00f;
  data_pack_local[(23)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(10)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(11)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(22)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(23)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(25)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(29)]);
  data_pack_local[(24)] = 0.000000e+00f;
  data_pack_local[(24)] = __ocml_fma_f32(d[(6)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(18)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(28)]);
  data_pack_local[(25)] = 0.000000e+00f;
  data_pack_local[(25)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(28)]);
  data_pack_local[(26)] = 0.000000e+00f;
  data_pack_local[(26)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = (data_pack_local[(26)] + d[(28)]);
  data_pack_local[(27)] = 0.000000e+00f;
  data_pack_local[(27)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = (data_pack_local[(27)] + d[(28)]);
  data_pack_local[(28)] = 0.000000e+00f;
  data_pack_local[(28)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = (data_pack_local[(28)] + d[(28)]);
  data_pack_local[(29)] = 0.000000e+00f;
  data_pack_local[(29)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(10)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(11)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(22)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(23)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(25)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(29)]);
  data_pack_local[(30)] = 0.000000e+00f;
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(6)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(10)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(12)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(18)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(24)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(31)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(32)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(33)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(34)]);
  data_pack_local[(31)] = 0.000000e+00f;
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(7)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(10)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(32)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(33)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(34)]);
  data_pack_local[(32)] = 0.000000e+00f;
  data_pack_local[(32)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(10)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(31)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(32)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(33)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(34)]);
  data_pack_local[(33)] = 0.000000e+00f;
  data_pack_local[(33)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(10)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(31)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(33)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(34)]);
  data_pack_local[(34)] = 0.000000e+00f;
  data_pack_local[(34)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(10)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(31)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(33)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(34)]);
  data_pack_local[(35)] = 0.000000e+00f;
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(7)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(11)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(16)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(17)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(22)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(23)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(28)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(29)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(31)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(32)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(33)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(34)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(35)]);
  for (int eps1 = 0; eps1 < 6; ++eps1) {
    for (int nu1 = 0; nu1 < 6; ++nu1) {
      data_pack[(((((eps1 * 75264) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 6) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_1_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[1568];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) & 15)))];
    placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 4) & 15)))];
    if (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) < 120) {
      if (((int)threadIdx.y) < 3) {
        placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 8) & 15)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 196))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 392))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 588))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 588))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 980))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 980))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1176))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1176))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1372))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1372))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 4))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 3))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 16))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 17))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 18))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 19))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 32))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 33))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 34))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 35))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 48))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 49))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 50))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 51))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 64))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 65))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 66))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 67))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 80))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 81))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 82))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 83))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 96))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 97))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 98))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 99))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 112))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 113))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 114))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 115))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 128))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 129))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 130))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 131))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 144))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 145))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 146))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 147))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 160))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 161))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 162))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 163))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 176))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 177))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 178))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 179))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 192))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 193))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 194))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 195))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 208))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 209))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 210))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 211))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 224))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 225))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 226))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 227))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 240))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 241))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 242))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 243))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 256))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 257))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 258))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 259))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 272))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 273))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 274))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 275))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 288))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 289))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 290))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 291))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 304))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 305))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 306))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 307))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 320))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 321))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 322))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 323))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 336))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 337))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 338))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 339))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 352))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 353))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 354))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 355))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 368))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 369))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 370))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 371))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 384))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 385))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 386))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 387))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 400))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 401))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 402))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 403))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 416))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 417))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 418))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 419))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 432))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 433))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 434))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 435))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 448))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 449))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 450))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 451))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 464))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 465))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 466))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 467))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 480))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 481))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 482))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 483))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 496))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 497))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 498))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 499))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 49))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 147))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_conv2d_1_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute_local[2];
  __shared__ float pad_temp_shared[336];
  __shared__ float placeholder_shared[2048];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    __syncthreads();
    if ((((((int)threadIdx.z) * 6) + (((int)threadIdx.y) * 3)) + ((int)threadIdx.x)) < 336) {
      if (((((int)threadIdx.y) * 3) + ((int)threadIdx.x)) < 6) {
        if (((int)threadIdx.x) < 3) {
          pad_temp_shared[((((((int)threadIdx.z) * 6) + (((int)threadIdx.y) * 3)) + ((int)threadIdx.x)))] = placeholder[(((((((rc_outer * 50176) + (((((((int)threadIdx.z) * 6) + (((int)threadIdx.y) * 3)) + ((int)threadIdx.x)) / 21) * 3136)) + (((int)blockIdx.y) * 224)) + ((((((((int)threadIdx.z) * 6) + (((int)threadIdx.y) * 3)) + ((int)threadIdx.x)) % 21) / 7) * 56)) + (((int)blockIdx.x) * 8)) + ((((((int)threadIdx.z) * 6) + (((int)threadIdx.y) * 3)) + ((int)threadIdx.x)) % 7)))];
        }
      }
    }
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 4; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      placeholder_shared[(((((((int)threadIdx.z) * 32) + (((int)threadIdx.y) * 16)) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = placeholder1[((((((((int)threadIdx.z) * 128) + (((int)threadIdx.y) * 64)) + (rc_outer * 16)) + (((int)threadIdx.x) * 4)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))];
    }
    __syncthreads();
    for (int rc_inner = 0; rc_inner < 16; ++rc_inner) {
      compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((rc_inner * 21) + (((int)threadIdx.y) * 14)) + (((int)threadIdx.x) * 2)))], placeholder_shared[(((((int)threadIdx.z) * 16) + rc_inner))], compute_local[(0)]);
      compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((rc_inner * 21) + (((int)threadIdx.y) * 14)) + (((int)threadIdx.x) * 2)))], placeholder_shared[((((((int)threadIdx.z) * 16) + rc_inner) + 1024))], compute_local[(1)]);
    }
  }
  compute[((((((((int)threadIdx.z) * 784) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + (((int)blockIdx.x) * 4)) + ((int)threadIdx.x)))] = compute_local[(0)];
  compute[(((((((((int)threadIdx.z) * 784) + (((int)blockIdx.y) * 56)) + (((int)threadIdx.y) * 28)) + (((int)blockIdx.x) * 4)) + ((int)threadIdx.x)) + 50176))] = compute_local[(1)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_3_kernel2(float* __restrict__ bgemm, float* __restrict__ T_add, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[16];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(1)]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(2)]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))]);
  inverse[(4)] = 0.000000e+00f;
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(4)]);
  inverse[(5)] = 0.000000e+00f;
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = (inverse[(5)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(6)] = 0.000000e+00f;
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(7)] = 0.000000e+00f;
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -2.000000e+00f, inverse[(7)]);
  inverse[(8)] = 0.000000e+00f;
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(8)]);
  inverse[(9)] = 0.000000e+00f;
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -2.000000e+00f, inverse[(9)]);
  inverse[(10)] = 0.000000e+00f;
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), 4.000000e+00f, inverse[(10)]);
  inverse[(11)] = 0.000000e+00f;
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], 4.000000e+00f, inverse[(11)]);
  inverse[(12)] = 0.000000e+00f;
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))]);
  inverse[(13)] = 0.000000e+00f;
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -2.000000e+00f, inverse[(13)]);
  inverse[(14)] = 0.000000e+00f;
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], 4.000000e+00f, inverse[(14)]);
  inverse[(15)] = 0.000000e+00f;
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 439040))]);
  for (int ax2_inner = 0; ax2_inner < 4; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 4; ++ax3_inner) {
      T_add[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (ax2_inner * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + ax3_inner))] = (inverse[(((ax2_inner * 4) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (ax2_inner * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + ax3_inner))]);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_multiply_add_nn_re_11882905421691233276__kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((int)threadIdx.x) & 15) >> 2) * 2) + eps)) && (((((((int)threadIdx.x) & 15) >> 2) * 2) + eps) < 8)) && (1 <= (((((int)threadIdx.x) & 3) * 2) + nu))) && ((((((int)threadIdx.x) & 3) * 2) + nu) < 8)) ? placeholder[((((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (eps * 7)) + ((((int)threadIdx.x) & 3) * 2)) + nu) - 8))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 32768) + (nu1 * 8192)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_2_kernel2(float* __restrict__ bgemm, float* __restrict__ T_add, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_add[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (ax2_inner * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + ax3_inner))] = (inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (ax2_inner * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + ax3_inner))]);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_2_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (ax2_inner * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + ax3_inner))] = max((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 196))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_3_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[36];
  float data_pack_local[36];
  for (int eps = 0; eps < 6; ++eps) {
    for (int nu = 0; nu < 6; ++nu) {
      d[(((eps * 6) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 4) + eps) < 57)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4) + nu) < 57)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (eps * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + nu) - 57))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(1)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(3)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(4)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(6)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(12)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(18)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(24)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(28)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(2)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(3)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(4)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(25)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(28)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(2)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(3)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(4)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(28)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(3)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(4)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(28)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(1)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(3)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(7)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(13)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(16)], -2.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(19)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(22)], 1.500000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(28)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(1)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(2)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(3)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(4)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(8)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(9)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(10)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(11)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(13)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(14)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(15)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(16)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(17)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(19)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(20)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(21)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32((d[(22)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(23)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(25)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(29)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(12)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(18)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(24)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(28)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(10)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(25)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(28)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(10)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(28)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(28)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(13)] * -2.500000e+00f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(16)], -2.500000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(19)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(22)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(10)]);
  data_pack_local[(10)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(10)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(28)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(13)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(14)] * -2.500000e+00f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(15)] * -2.500000e+00f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(16)] * -2.500000e+00f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(17)], -2.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(19)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(20)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(21)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32((d[(22)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(23)], 5.000000e-01f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(25)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(29)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(12)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(18)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(24)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(28)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(25)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(28)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(28)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(28)]);
  data_pack_local[(16)] = 0.000000e+00f;
  data_pack_local[(16)] = __ocml_fma_f32((d[(7)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(13)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(16)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(19)] * 2.500000e+00f), 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(22)], 2.500000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(16)]);
  data_pack_local[(16)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(16)]);
  data_pack_local[(16)] = (data_pack_local[(16)] + d[(28)]);
  data_pack_local[(17)] = 0.000000e+00f;
  data_pack_local[(17)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(8)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(13)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(14)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(15)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(16)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(17)], 5.000000e-01f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(19)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(20)] * 2.500000e+00f), -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(21)] * 2.500000e+00f), -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32((d[(22)] * 2.500000e+00f), 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(23)], 2.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(25)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(17)]);
  data_pack_local[(17)] = (data_pack_local[(17)] + d[(29)]);
  data_pack_local[(18)] = 0.000000e+00f;
  data_pack_local[(18)] = __ocml_fma_f32(d[(6)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(18)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(24)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(18)]);
  data_pack_local[(18)] = (data_pack_local[(18)] + d[(28)]);
  data_pack_local[(19)] = 0.000000e+00f;
  data_pack_local[(19)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(25)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(19)]);
  data_pack_local[(19)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(19)]);
  data_pack_local[(19)] = (data_pack_local[(19)] + d[(28)]);
  data_pack_local[(20)] = 0.000000e+00f;
  data_pack_local[(20)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(20)]);
  data_pack_local[(20)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(20)]);
  data_pack_local[(20)] = (data_pack_local[(20)] + d[(28)]);
  data_pack_local[(21)] = 0.000000e+00f;
  data_pack_local[(21)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(21)]);
  data_pack_local[(21)] = (data_pack_local[(21)] + d[(28)]);
  data_pack_local[(22)] = 0.000000e+00f;
  data_pack_local[(22)] = __ocml_fma_f32((d[(7)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(10)], -2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(19)] * 2.000000e+00f), 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(22)], 2.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(22)]);
  data_pack_local[(22)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(22)]);
  data_pack_local[(22)] = (data_pack_local[(22)] + d[(28)]);
  data_pack_local[(23)] = 0.000000e+00f;
  data_pack_local[(23)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(8)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(9)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(10)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(11)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(19)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(20)] * 2.000000e+00f), -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(21)] * 2.000000e+00f), -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32((d[(22)] * 2.000000e+00f), 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(23)], 2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(25)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(23)]);
  data_pack_local[(23)] = (data_pack_local[(23)] + d[(29)]);
  data_pack_local[(24)] = 0.000000e+00f;
  data_pack_local[(24)] = __ocml_fma_f32(d[(6)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(12)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(18)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(25)], -1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(26)], -2.000000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = __ocml_fma_f32(d[(27)], 1.500000e+00f, data_pack_local[(24)]);
  data_pack_local[(24)] = (data_pack_local[(24)] + d[(28)]);
  data_pack_local[(25)] = 0.000000e+00f;
  data_pack_local[(25)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(26)], -2.500000e+00f, data_pack_local[(25)]);
  data_pack_local[(25)] = __ocml_fma_f32(d[(27)], 5.000000e-01f, data_pack_local[(25)]);
  data_pack_local[(25)] = (data_pack_local[(25)] + d[(28)]);
  data_pack_local[(26)] = 0.000000e+00f;
  data_pack_local[(26)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(25)], -1.000000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(26)], 5.000000e-01f, data_pack_local[(26)]);
  data_pack_local[(26)] = __ocml_fma_f32(d[(27)], 2.500000e+00f, data_pack_local[(26)]);
  data_pack_local[(26)] = (data_pack_local[(26)] + d[(28)]);
  data_pack_local[(27)] = 0.000000e+00f;
  data_pack_local[(27)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(25)], -2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = __ocml_fma_f32(d[(27)], 2.000000e+00f, data_pack_local[(27)]);
  data_pack_local[(27)] = (data_pack_local[(27)] + d[(28)]);
  data_pack_local[(28)] = 0.000000e+00f;
  data_pack_local[(28)] = __ocml_fma_f32((d[(7)] * 5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(10)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(13)] * -1.000000e+00f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(16)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(19)] * -5.000000e-01f), 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(22)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(25)], 5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(26)], -1.000000e+00f, data_pack_local[(28)]);
  data_pack_local[(28)] = __ocml_fma_f32(d[(27)], -5.000000e-01f, data_pack_local[(28)]);
  data_pack_local[(28)] = (data_pack_local[(28)] + d[(28)]);
  data_pack_local[(29)] = 0.000000e+00f;
  data_pack_local[(29)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(8)] * 5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(9)] * 5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(10)] * 5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(11)], 5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(14)] * -1.000000e+00f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(15)] * -1.000000e+00f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(16)] * -1.000000e+00f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(17)], -1.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(19)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(20)] * -5.000000e-01f), -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(21)] * -5.000000e-01f), -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32((d[(22)] * -5.000000e-01f), 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(23)], -5.000000e-01f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(25)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(26)], -1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(27)], -2.000000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(29)]);
  data_pack_local[(29)] = (data_pack_local[(29)] + d[(29)]);
  data_pack_local[(30)] = 0.000000e+00f;
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(6)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(7)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(8)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(9)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(10)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(12)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(18)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(24)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(31)], -1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(32)], -2.000000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = __ocml_fma_f32(d[(33)], 1.500000e+00f, data_pack_local[(30)]);
  data_pack_local[(30)] = (data_pack_local[(30)] + d[(34)]);
  data_pack_local[(31)] = 0.000000e+00f;
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(7)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(8)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(9)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(10)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(32)], -2.500000e+00f, data_pack_local[(31)]);
  data_pack_local[(31)] = __ocml_fma_f32(d[(33)], 5.000000e-01f, data_pack_local[(31)]);
  data_pack_local[(31)] = (data_pack_local[(31)] + d[(34)]);
  data_pack_local[(32)] = 0.000000e+00f;
  data_pack_local[(32)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(8)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(9)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(10)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(31)], -1.000000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(32)], 5.000000e-01f, data_pack_local[(32)]);
  data_pack_local[(32)] = __ocml_fma_f32(d[(33)], 2.500000e+00f, data_pack_local[(32)]);
  data_pack_local[(32)] = (data_pack_local[(32)] + d[(34)]);
  data_pack_local[(33)] = 0.000000e+00f;
  data_pack_local[(33)] = __ocml_fma_f32(d[(7)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(9)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(10)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(31)], -2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = __ocml_fma_f32(d[(33)], 2.000000e+00f, data_pack_local[(33)]);
  data_pack_local[(33)] = (data_pack_local[(33)] + d[(34)]);
  data_pack_local[(34)] = 0.000000e+00f;
  data_pack_local[(34)] = __ocml_fma_f32(d[(7)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(9)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(10)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(13)] * -1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(16)], -1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(19)] * -2.000000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(22)], -2.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(25)] * 1.500000e+00f), 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(28)], 1.500000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(31)], 5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(32)], -1.000000e+00f, data_pack_local[(34)]);
  data_pack_local[(34)] = __ocml_fma_f32(d[(33)], -5.000000e-01f, data_pack_local[(34)]);
  data_pack_local[(34)] = (data_pack_local[(34)] + d[(34)]);
  data_pack_local[(35)] = 0.000000e+00f;
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(7)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(8)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(9)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(10)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(11)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(13)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(14)] * -1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(15)] * -1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(16)] * -1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(17)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(19)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(20)] * -2.000000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(21)] * -2.000000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(22)] * -2.000000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(23)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(25)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(26)] * 1.500000e+00f), -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(27)] * 1.500000e+00f), -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32((d[(28)] * 1.500000e+00f), 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(29)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(31)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(32)], -1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(33)], -2.000000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = __ocml_fma_f32(d[(34)], 1.500000e+00f, data_pack_local[(35)]);
  data_pack_local[(35)] = (data_pack_local[(35)] + d[(35)]);
  for (int eps1 = 0; eps1 < 6; ++eps1) {
    for (int nu1 = 0; nu1 < 6; ++nu1) {
      data_pack[(((((eps1 * 75264) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 6) + nu1))];
    }
  }
}

extern "C" __global__ void fused_add_nn_relu_3_kernel0(float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_outer = 0; ax0_ax1_fused_ax2_fused_ax3_fused_outer < 4; ++ax0_ax1_fused_ax2_fused_ax3_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) < 200704) {
      T_relu[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] = max((placeholder[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) / 3136))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_1_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps) < 29)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu) < 29)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (eps * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + nu) - 29))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 100352) + (nu1 * 25088)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((int)threadIdx.x) & 15) >> 2) * 2) + eps)) && (((((((int)threadIdx.x) & 15) >> 2) * 2) + eps) < 8)) && (1 <= (((((int)threadIdx.x) & 3) * 2) + nu))) && ((((((int)threadIdx.x) & 3) * 2) + nu) < 8)) ? placeholder[((((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (eps * 7)) + ((((int)threadIdx.x) & 3) * 2)) + nu) - 8))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 32768) + (nu1 * 8192)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_add_nn_relu_kernel0(float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  T_relu[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] = max((placeholder[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] + placeholder1[((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) / 49))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_3_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[16];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(1)]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(2)]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))]);
  inverse[(4)] = 0.000000e+00f;
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(4)]);
  inverse[(5)] = 0.000000e+00f;
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = (inverse[(5)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(6)] = 0.000000e+00f;
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(7)] = 0.000000e+00f;
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -2.000000e+00f, inverse[(7)]);
  inverse[(8)] = 0.000000e+00f;
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(8)]);
  inverse[(9)] = 0.000000e+00f;
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -2.000000e+00f, inverse[(9)]);
  inverse[(10)] = 0.000000e+00f;
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), 4.000000e+00f, inverse[(10)]);
  inverse[(11)] = 0.000000e+00f;
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], 4.000000e+00f, inverse[(11)]);
  inverse[(12)] = 0.000000e+00f;
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))]);
  inverse[(13)] = 0.000000e+00f;
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -2.000000e+00f, inverse[(13)]);
  inverse[(14)] = 0.000000e+00f;
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], 4.000000e+00f, inverse[(14)]);
  inverse[(15)] = 0.000000e+00f;
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 439040))]);
  for (int ax2_inner = 0; ax2_inner < 4; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 4; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (ax2_inner * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + ax3_inner))] = max((inverse[(((ax2_inner * 4) + ax3_inner))] + placeholder[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 196))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[1568];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) & 15)))];
    placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 4) & 15)))];
    if (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) < 120) {
      if (((int)threadIdx.y) < 3) {
        placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 8) & 15)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 196))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 392))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 588))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 588))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 980))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 980))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1176))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1176))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1372))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1372))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 4))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 3))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 16))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 17))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 18))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 19))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 32))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 33))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 34))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 35))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 48))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 49))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 50))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 51))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 64))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 65))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 66))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 67))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 80))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 81))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 82))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 83))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 96))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 97))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 98))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 99))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 112))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 113))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 114))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 115))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 128))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 129))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 130))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 131))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 144))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 145))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 146))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 147))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 160))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 161))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 162))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 163))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 176))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 177))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 178))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 179))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 192))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 193))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 194))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 195))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 208))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 209))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 210))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 211))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 224))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 225))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 226))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 227))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 240))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 241))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 242))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 243))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 256))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 257))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 258))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 259))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 272))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 273))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 274))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 275))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 288))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 289))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 290))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 291))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 304))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 305))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 306))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 307))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 320))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 321))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 322))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 323))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 336))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 337))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 338))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 339))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 352))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 353))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 354))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 355))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 368))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 369))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 370))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 371))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 384))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 385))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 386))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 387))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 400))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 401))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 402))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 403))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 416))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 417))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 418))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 419))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 432))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 433))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 434))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 435))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 448))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 449))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 450))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 451))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 464))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 465))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 466))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 467))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 480))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 481))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 482))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 483))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 496))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 497))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 498))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 499))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 49))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 147))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_2_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[16];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -2.000000e+00f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 5.000000e-01f, inverse[(1)]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(1)]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 4.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 2.500000e-01f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(2)]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 1.250000e-01f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))]);
  inverse[(4)] = 0.000000e+00f;
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(4)]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(4)] = (inverse[(4)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 5.000000e-01f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -2.000000e+00f, inverse[(4)]);
  inverse[(4)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -2.000000e+00f, inverse[(4)]);
  inverse[(5)] = 0.000000e+00f;
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = (inverse[(5)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 5.000000e-01f, inverse[(5)]);
  inverse[(5)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -2.000000e+00f, inverse[(5)]);
  inverse[(6)] = 0.000000e+00f;
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(6)] = (inverse[(6)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), 4.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 2.500000e-01f, inverse[(6)]);
  inverse[(6)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), 4.000000e+00f, inverse[(6)]);
  inverse[(7)] = 0.000000e+00f;
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = (inverse[(7)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 5.000000e-01f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 5.000000e-01f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 5.000000e-01f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 5.000000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -2.000000e+00f), -1.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -2.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -2.000000e+00f), 1.250000e-01f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -2.000000e+00f), -8.000000e+00f, inverse[(7)]);
  inverse[(7)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -2.000000e+00f, inverse[(7)]);
  inverse[(8)] = 0.000000e+00f;
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(8)] = (inverse[(8)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 2.500000e-01f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], 4.000000e+00f, inverse[(8)]);
  inverse[(8)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], 4.000000e+00f, inverse[(8)]);
  inverse[(9)] = 0.000000e+00f;
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = (inverse[(9)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -2.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 5.000000e-01f, inverse[(9)]);
  inverse[(9)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -2.000000e+00f, inverse[(9)]);
  inverse[(10)] = 0.000000e+00f;
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(10)] = (inverse[(10)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 2.500000e-01f, inverse[(10)]);
  inverse[(10)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), 4.000000e+00f, inverse[(10)]);
  inverse[(11)] = 0.000000e+00f;
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = (inverse[(11)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 2.500000e-01f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 2.500000e-01f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 2.500000e-01f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 2.500000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * 4.000000e+00f), -1.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], 4.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * 4.000000e+00f), 1.250000e-01f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * 4.000000e+00f), -8.000000e+00f, inverse[(11)]);
  inverse[(11)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], 4.000000e+00f, inverse[(11)]);
  inverse[(12)] = 0.000000e+00f;
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))], -1.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 225792))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))], 1.250000e-01f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 301056))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))], -8.000000e+00f, inverse[(12)]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 376320))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))]);
  inverse[(12)] = (inverse[(12)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))]);
  inverse[(13)] = 0.000000e+00f;
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -2.000000e+00f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(13)]);
  inverse[(13)] = (inverse[(13)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 5.000000e-01f, inverse[(13)]);
  inverse[(13)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -2.000000e+00f, inverse[(13)]);
  inverse[(14)] = 0.000000e+00f;
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), 4.000000e+00f, inverse[(14)]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))]);
  inverse[(14)] = (inverse[(14)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 2.500000e-01f, inverse[(14)]);
  inverse[(14)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], 4.000000e+00f, inverse[(14)]);
  inverse[(15)] = 0.000000e+00f;
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))] * -1.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))] * -1.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))] * -1.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 200704))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 213248))]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 238336))] * 1.250000e-01f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 250880))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 263424))] * 1.250000e-01f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 275968))] * 1.250000e-01f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 288512))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 313600))] * -8.000000e+00f), -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 326144))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 338688))] * -8.000000e+00f), 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 351232))] * -8.000000e+00f), -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 363776))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 388864))], -1.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 401408))]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 413952))], 1.250000e-01f, inverse[(15)]);
  inverse[(15)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 426496))], -8.000000e+00f, inverse[(15)]);
  inverse[(15)] = (inverse[(15)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 439040))]);
  for (int ax2_inner = 0; ax2_inner < 4; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 4; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (ax2_inner * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + ax3_inner))] = max(((inverse[(((ax2_inner * 4) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 224) + (ax2_inner * 56)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 4)) + ax3_inner))]) + placeholder1[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 196))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_1_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps) < 15)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu) < 15)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (eps * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + nu) - 15))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 50176) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (ax2_inner * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + ax3_inner))] = max(((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (ax2_inner * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + ax3_inner))]) + placeholder1[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 49))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_conv2d_add_nn_relu_1_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_relu, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute[2];
  __shared__ float pad_temp_shared[1160];
  __shared__ float placeholder_shared[2304];
  compute[(0)] = 0.000000e+00f;
  compute[(1)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 16; ++rc_outer) {
    __syncthreads();
    if ((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) < 1160) {
      if (((((int)threadIdx.y) * 19) + (((int)threadIdx.x) * 3)) < 37) {
        pad_temp_shared[((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)))] = (((1 <= ((((int)blockIdx.y) * 4) + (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) % 145) / 29))) && (1 <= ((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) % 29))) ? placeholder[(((((((rc_outer * 6272) + (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) / 145) * 784)) + (((int)blockIdx.y) * 112)) + ((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) % 145) / 29) * 28)) + ((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) % 29)) - 29))] : 0.000000e+00f);
      }
    }
    if ((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) < 1159) {
      if (((((int)threadIdx.y) * 19) + (((int)threadIdx.x) * 3)) < 36) {
        if (((int)threadIdx.x) < 6) {
          pad_temp_shared[(((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1))] = (((1 <= ((((int)blockIdx.y) * 4) + ((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1) % 145) / 29))) && (1 <= (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1) % 29))) ? placeholder[(((((((rc_outer * 6272) + ((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1) / 145) * 784)) + (((int)blockIdx.y) * 112)) + (((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1) % 145) / 29) * 28)) + (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 1) % 29)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if ((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) < 1158) {
      if (((((int)threadIdx.y) * 19) + (((int)threadIdx.x) * 3)) < 35) {
        if (((int)threadIdx.x) < 6) {
          pad_temp_shared[(((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2))] = (((1 <= ((((int)blockIdx.y) * 4) + ((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2) % 145) / 29))) && (1 <= (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2) % 29))) ? placeholder[(((((((rc_outer * 6272) + ((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2) / 145) * 784)) + (((int)blockIdx.y) * 112)) + (((((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2) % 145) / 29) * 28)) + (((((((int)threadIdx.z) * 37) + (((int)threadIdx.y) * 19)) + (((int)threadIdx.x) * 3)) + 2) % 29)) - 29))] : 0.000000e+00f);
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + ((((int)threadIdx.x) * 2) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 768) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2304) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 72) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)))] = placeholder1[((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + ((((int)threadIdx.x) * 2) * 3)))];
              }
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + ((((int)threadIdx.x) * 2) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 768) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2303) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 71) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) + 1))] = placeholder1[(((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + ((((int)threadIdx.x) * 2) * 3)) + 1))];
              }
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + ((((int)threadIdx.x) * 2) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 768) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2302) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 70) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) + 2))] = placeholder1[(((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + ((((int)threadIdx.x) * 2) * 3)) + 2))];
              }
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 767) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2301) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 69) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) + 3))] = placeholder1[((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + (((((int)threadIdx.x) * 2) + 1) * 3)))];
              }
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 767) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2300) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 68) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) + 4))] = placeholder1[(((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + (((((int)threadIdx.x) * 2) + 1) * 3)) + 1))];
              }
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.y) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) >> 3) + ((int)threadIdx.z)) < 32) {
      if ((((((int)threadIdx.z) * 8) + (((int)threadIdx.y) * 4)) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if ((((((int)threadIdx.z) * 24) + (((int)threadIdx.y) * 12)) + (((int)threadIdx.x) * 2)) < 767) {
          if ((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) < 2299) {
            if (((((int)threadIdx.y) * 36) + (((int)threadIdx.x) * 6)) < 67) {
              if (((int)threadIdx.x) < 6) {
                placeholder_shared[(((((((int)threadIdx.z) * 72) + (((int)threadIdx.y) * 36)) + (((int)threadIdx.x) * 6)) + 5))] = placeholder1[(((((((((int)blockIdx.z) * 36864) + (((int)threadIdx.z) * 1152)) + (rc_outer * 72)) + (((int)threadIdx.y) * 36)) + (((((int)threadIdx.x) * 2) + 1) * 3)) + 2))];
              }
            }
          }
        }
      }
    }
    __syncthreads();
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 2))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 3))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 2))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 4))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 29))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 31))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 30))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 32))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 31))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 33))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 58))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 60))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 59))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 61))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 60))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 62))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 145))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 147))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 146))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 148))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 147))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 149))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 174))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 176))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 175))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 177))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 176))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 178))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 203))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 205))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 204))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 206))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 205))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 207))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 290))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 292))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 291))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 293))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 292))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 294))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 319))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 321))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 320))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 322))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 321))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 323))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 348))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 350))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 349))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 351))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 350))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 352))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 435))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 437))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 436))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 438))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 437))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 439))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 464))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 466))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 465))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 467))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 466))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 468))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 493))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 495))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 494))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 496))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 495))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 497))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 580))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 582))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 581))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 583))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 582))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 584))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 609))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 611))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 610))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 612))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 611))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 613))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 638))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 640))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 639))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 641))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 640))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 642))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 725))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 727))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 726))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 728))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 727))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 729))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 754))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 756))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 755))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 757))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 756))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 758))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 783))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 785))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 784))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 786))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 785))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 787))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 870))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 872))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 871))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 873))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 872))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 874))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 899))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 901))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 900))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 902))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 901))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 903))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 928))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 930))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 929))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 931))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 930))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 932))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1015))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1017))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1016))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1018))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1017))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1019))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1044))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1046))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1045))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1047))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1046))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1048))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1073))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1075))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1074))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1076))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(1)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1075))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 58) + (((int)threadIdx.x) * 4)) + 1077))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(1)]);
  }
  T_relu[((((((((int)blockIdx.z) * 6272) + (((int)threadIdx.z) * 196)) + (((int)blockIdx.y) * 28)) + (((int)threadIdx.y) * 14)) + (((int)threadIdx.x) * 2)))] = max((compute[(0)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
  T_relu[(((((((((int)blockIdx.z) * 6272) + (((int)threadIdx.z) * 196)) + (((int)blockIdx.y) * 28)) + (((int)threadIdx.y) * 14)) + (((int)threadIdx.x) * 2)) + 1))] = max((compute[(1)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_conv2d_add_nn_relu_2_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_relu, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute[4];
  __shared__ float pad_temp_shared[2088];
  __shared__ float placeholder_shared[2304];
  compute[(0)] = 0.000000e+00f;
  compute[(1)] = 0.000000e+00f;
  compute[(2)] = 0.000000e+00f;
  compute[(3)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 8; ++rc_outer) {
    __syncthreads();
    if (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) < 2088) {
      pad_temp_shared[(((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)))] = (((1 <= ((((int)blockIdx.y) * 8) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) % 261) / 29))) && (1 <= ((((int)blockIdx.x) * 28) + (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) % 29)))) ? placeholder[((((((((rc_outer * 25088) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) / 261) * 3136)) + (((int)blockIdx.y) * 448)) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) % 261) / 29) * 56)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) % 29)) - 57))] : 0.000000e+00f);
    }
    if (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) < 2087) {
      if (((int)threadIdx.x) < 13) {
        pad_temp_shared[((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1))] = (((1 <= ((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1) % 261) / 29))) && (1 <= ((((int)blockIdx.x) * 28) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1) % 29)))) ? placeholder[((((((((rc_outer * 25088) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1) / 261) * 3136)) + (((int)blockIdx.y) * 448)) + ((((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1) % 261) / 29) * 56)) + (((int)blockIdx.x) * 28)) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 1) % 29)) - 57))] : 0.000000e+00f);
      }
    }
    if (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) < 2086) {
      if (((int)threadIdx.x) < 13) {
        pad_temp_shared[((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2))] = (((1 <= ((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2) % 261) / 29))) && (1 <= ((((int)blockIdx.x) * 28) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2) % 29)))) ? placeholder[((((((((rc_outer * 25088) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2) / 261) * 3136)) + (((int)blockIdx.y) * 448)) + ((((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2) % 261) / 29) * 56)) + (((int)blockIdx.x) * 28)) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 2) % 29)) - 57))] : 0.000000e+00f);
      }
    }
    if (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) < 2085) {
      if (((int)threadIdx.x) < 13) {
        pad_temp_shared[((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3))] = (((1 <= ((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3) % 261) / 29))) && (1 <= ((((int)blockIdx.x) * 28) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3) % 29)))) ? placeholder[((((((((rc_outer * 25088) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3) / 261) * 3136)) + (((int)blockIdx.y) * 448)) + ((((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3) % 261) / 29) * 56)) + (((int)blockIdx.x) * 28)) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 3) % 29)) - 57))] : 0.000000e+00f);
      }
    }
    if (((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) < 2084) {
      if (((int)threadIdx.x) < 13) {
        pad_temp_shared[((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4))] = (((1 <= ((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4) % 261) / 29))) && (1 <= ((((int)blockIdx.x) * 28) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4) % 29)))) ? placeholder[((((((((rc_outer * 25088) + (((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4) / 261) * 3136)) + (((int)blockIdx.y) * 448)) + ((((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4) % 261) / 29) * 56)) + (((int)blockIdx.x) * 28)) + ((((((int)threadIdx.z) * 66) + (((int)threadIdx.x) * 5)) + 4) % 29)) - 57))] : 0.000000e+00f);
      }
    }
    if (((((int)threadIdx.x) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 768) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2304) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[(((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)))] = placeholder1[(((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.x) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 768) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2303) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) + 1))] = placeholder1[((((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.x) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + ((((int)threadIdx.x) * 2) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 768) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2302) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) + 2))] = placeholder1[((((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)) + 2))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 24) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 767) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2301) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) + 3))] = placeholder1[((((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)) + 3))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 24) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 767) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2300) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) + 4))] = placeholder1[((((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)) + 4))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 24) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 8) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 256) {
        if (((((int)threadIdx.z) * 24) + (((int)threadIdx.x) * 2)) < 767) {
          if (((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) < 2299) {
            if (((int)threadIdx.x) < 12) {
              placeholder_shared[((((((int)threadIdx.z) * 72) + (((int)threadIdx.x) * 6)) + 5))] = placeholder1[((((((((int)blockIdx.z) * 18432) + (((int)threadIdx.z) * 576)) + (rc_outer * 72)) + (((int)threadIdx.x) * 6)) + 5))];
            }
          }
        }
      }
    }
    __syncthreads();
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((int)threadIdx.x) * 2))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 58))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 116))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 174))], placeholder_shared[((((int)threadIdx.z) * 72))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 59))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 117))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 175))], placeholder_shared[(((((int)threadIdx.z) * 72) + 1))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 60))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 118))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 176))], placeholder_shared[(((((int)threadIdx.z) * 72) + 2))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 29))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 87))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 145))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 203))], placeholder_shared[(((((int)threadIdx.z) * 72) + 3))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 30))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 88))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 146))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 204))], placeholder_shared[(((((int)threadIdx.z) * 72) + 4))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 31))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 89))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 147))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 205))], placeholder_shared[(((((int)threadIdx.z) * 72) + 5))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 58))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 116))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 174))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 232))], placeholder_shared[(((((int)threadIdx.z) * 72) + 6))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 59))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 117))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 175))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 233))], placeholder_shared[(((((int)threadIdx.z) * 72) + 7))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 60))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 118))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 176))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 234))], placeholder_shared[(((((int)threadIdx.z) * 72) + 8))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 261))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 319))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 377))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 435))], placeholder_shared[(((((int)threadIdx.z) * 72) + 9))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 262))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 320))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 378))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 436))], placeholder_shared[(((((int)threadIdx.z) * 72) + 10))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 263))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 321))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 379))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 437))], placeholder_shared[(((((int)threadIdx.z) * 72) + 11))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 290))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 348))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 406))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 464))], placeholder_shared[(((((int)threadIdx.z) * 72) + 12))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 291))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 349))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 407))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 465))], placeholder_shared[(((((int)threadIdx.z) * 72) + 13))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 292))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 350))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 408))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 466))], placeholder_shared[(((((int)threadIdx.z) * 72) + 14))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 319))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 377))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 435))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 493))], placeholder_shared[(((((int)threadIdx.z) * 72) + 15))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 320))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 378))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 436))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 494))], placeholder_shared[(((((int)threadIdx.z) * 72) + 16))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 321))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 379))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 437))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 495))], placeholder_shared[(((((int)threadIdx.z) * 72) + 17))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 522))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 580))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 638))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 696))], placeholder_shared[(((((int)threadIdx.z) * 72) + 18))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 523))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 581))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 639))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 697))], placeholder_shared[(((((int)threadIdx.z) * 72) + 19))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 524))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 582))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 640))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 698))], placeholder_shared[(((((int)threadIdx.z) * 72) + 20))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 551))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 609))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 667))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 725))], placeholder_shared[(((((int)threadIdx.z) * 72) + 21))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 552))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 610))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 668))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 726))], placeholder_shared[(((((int)threadIdx.z) * 72) + 22))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 553))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 611))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 669))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 727))], placeholder_shared[(((((int)threadIdx.z) * 72) + 23))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 580))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 638))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 696))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 754))], placeholder_shared[(((((int)threadIdx.z) * 72) + 24))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 581))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 639))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 697))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 755))], placeholder_shared[(((((int)threadIdx.z) * 72) + 25))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 582))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 640))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 698))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 756))], placeholder_shared[(((((int)threadIdx.z) * 72) + 26))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 783))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 841))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 899))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 957))], placeholder_shared[(((((int)threadIdx.z) * 72) + 27))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 784))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 842))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 900))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 958))], placeholder_shared[(((((int)threadIdx.z) * 72) + 28))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 785))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 843))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 901))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 959))], placeholder_shared[(((((int)threadIdx.z) * 72) + 29))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 812))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 870))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 928))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 986))], placeholder_shared[(((((int)threadIdx.z) * 72) + 30))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 813))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 871))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 929))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 987))], placeholder_shared[(((((int)threadIdx.z) * 72) + 31))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 814))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 872))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 930))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 988))], placeholder_shared[(((((int)threadIdx.z) * 72) + 32))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 841))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 899))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 957))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1015))], placeholder_shared[(((((int)threadIdx.z) * 72) + 33))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 842))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 900))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 958))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1016))], placeholder_shared[(((((int)threadIdx.z) * 72) + 34))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 843))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 901))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 959))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1017))], placeholder_shared[(((((int)threadIdx.z) * 72) + 35))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1044))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1102))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1160))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1218))], placeholder_shared[(((((int)threadIdx.z) * 72) + 36))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1045))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1103))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1161))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1219))], placeholder_shared[(((((int)threadIdx.z) * 72) + 37))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1046))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1104))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1162))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1220))], placeholder_shared[(((((int)threadIdx.z) * 72) + 38))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1073))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1131))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1189))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1247))], placeholder_shared[(((((int)threadIdx.z) * 72) + 39))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1074))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1132))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1190))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1248))], placeholder_shared[(((((int)threadIdx.z) * 72) + 40))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1075))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1133))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1191))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1249))], placeholder_shared[(((((int)threadIdx.z) * 72) + 41))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1102))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1160))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1218))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1276))], placeholder_shared[(((((int)threadIdx.z) * 72) + 42))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1103))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1161))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1219))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1277))], placeholder_shared[(((((int)threadIdx.z) * 72) + 43))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1104))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1162))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1220))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1278))], placeholder_shared[(((((int)threadIdx.z) * 72) + 44))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1305))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1363))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1421))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1479))], placeholder_shared[(((((int)threadIdx.z) * 72) + 45))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1306))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1364))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1422))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1480))], placeholder_shared[(((((int)threadIdx.z) * 72) + 46))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1307))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1365))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1423))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1481))], placeholder_shared[(((((int)threadIdx.z) * 72) + 47))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1334))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1392))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1450))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1508))], placeholder_shared[(((((int)threadIdx.z) * 72) + 48))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1335))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1393))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1451))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1509))], placeholder_shared[(((((int)threadIdx.z) * 72) + 49))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1336))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1394))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1452))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1510))], placeholder_shared[(((((int)threadIdx.z) * 72) + 50))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1363))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1421))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1479))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1537))], placeholder_shared[(((((int)threadIdx.z) * 72) + 51))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1364))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1422))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1480))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1538))], placeholder_shared[(((((int)threadIdx.z) * 72) + 52))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1365))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1423))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1481))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1539))], placeholder_shared[(((((int)threadIdx.z) * 72) + 53))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1566))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1624))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1682))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1740))], placeholder_shared[(((((int)threadIdx.z) * 72) + 54))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1567))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1625))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1683))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1741))], placeholder_shared[(((((int)threadIdx.z) * 72) + 55))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1568))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1626))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1684))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1742))], placeholder_shared[(((((int)threadIdx.z) * 72) + 56))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1595))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1653))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1711))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1769))], placeholder_shared[(((((int)threadIdx.z) * 72) + 57))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1596))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1654))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1712))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1770))], placeholder_shared[(((((int)threadIdx.z) * 72) + 58))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1597))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1655))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1713))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1771))], placeholder_shared[(((((int)threadIdx.z) * 72) + 59))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1624))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1682))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1740))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1798))], placeholder_shared[(((((int)threadIdx.z) * 72) + 60))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1625))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1683))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1741))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1799))], placeholder_shared[(((((int)threadIdx.z) * 72) + 61))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1626))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1684))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1742))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1800))], placeholder_shared[(((((int)threadIdx.z) * 72) + 62))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1827))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1885))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1943))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2001))], placeholder_shared[(((((int)threadIdx.z) * 72) + 63))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1828))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1886))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1944))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2002))], placeholder_shared[(((((int)threadIdx.z) * 72) + 64))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1829))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1887))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1945))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2003))], placeholder_shared[(((((int)threadIdx.z) * 72) + 65))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1856))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1914))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1972))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2030))], placeholder_shared[(((((int)threadIdx.z) * 72) + 66))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1857))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1915))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1973))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2031))], placeholder_shared[(((((int)threadIdx.z) * 72) + 67))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1858))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1916))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1974))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2032))], placeholder_shared[(((((int)threadIdx.z) * 72) + 68))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1885))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1943))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2001))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2059))], placeholder_shared[(((((int)threadIdx.z) * 72) + 69))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1886))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1944))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2002))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2060))], placeholder_shared[(((((int)threadIdx.z) * 72) + 70))], compute[(3)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1887))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(0)]);
    compute[(1)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1945))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(1)]);
    compute[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2003))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(2)]);
    compute[(3)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2061))], placeholder_shared[(((((int)threadIdx.z) * 72) + 71))], compute[(3)]);
  }
  T_relu[((((((((int)blockIdx.z) * 25088) + (((int)threadIdx.z) * 784)) + (((int)blockIdx.y) * 112)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)))] = max((compute[(0)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
  T_relu[(((((((((int)blockIdx.z) * 25088) + (((int)threadIdx.z) * 784)) + (((int)blockIdx.y) * 112)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 28))] = max((compute[(1)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
  T_relu[(((((((((int)blockIdx.z) * 25088) + (((int)threadIdx.z) * 784)) + (((int)blockIdx.y) * 112)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 56))] = max((compute[(2)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
  T_relu[(((((((((int)blockIdx.z) * 25088) + (((int)threadIdx.z) * 784)) + (((int)blockIdx.y) * 112)) + (((int)blockIdx.x) * 14)) + ((int)threadIdx.x)) + 84))] = max((compute[(3)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_global_avg_pool2d_kernel0(float* __restrict__ placeholder, float* __restrict__ tensor) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float tensor1[1];
  tensor1[(0)] = 0.000000e+00f;
  for (int rv0 = 0; rv0 < 7; ++rv0) {
    for (int rv1 = 0; rv1 < 7; ++rv1) {
      if (((int)threadIdx.y) < 1) {
        tensor1[(0)] = (tensor1[(0)] + placeholder[((((((((int)threadIdx.y) * 25088) + (((int)blockIdx.x) * 392)) + (((int)threadIdx.x) * 49)) + (rv0 * 7)) + rv1))]);
      }
    }
  }
  if (((int)threadIdx.y) < 1) {
    tensor[((((((int)threadIdx.y) * 512) + (((int)blockIdx.x) * 8)) + ((int)threadIdx.x)))] = (tensor1[(0)] * 2.040816e-02f);
  }
}

extern "C" __global__ void fused_nn_dense_add_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_add, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float T_dense_rf[1];
  float red_buf0[1];
  __shared__ float T_dense[1];
  T_dense_rf[(0)] = 0.000000e+00f;
  for (int k_outer = 0; k_outer < 8; ++k_outer) {
    T_dense_rf[(0)] = __ocml_fma_f32(placeholder[(((k_outer * 64) + ((int)threadIdx.x)))], placeholder1[((((((int)blockIdx.x) * 512) + (k_outer * 64)) + ((int)threadIdx.x)))], T_dense_rf[(0)]);
  }
  unsigned int mask[1];
  float t0[1];
  red_buf0[(0)] = T_dense_rf[(0)];
  ((int*)mask)[(0)] = 0;
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 32) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 32)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 16) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 16)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 8) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 8)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 4) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 4)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 2) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 2)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  t0[(0)] = __hip_ds_bpermutef((((((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & 63) + 1) >= 64) ? __mbcnt_hi(-1, __mbcnt_lo(-1, 0)) : (__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) + 1)) << 2), red_buf0[(0)]);
  red_buf0[(0)] = (red_buf0[(0)] + t0[(0)]);
  red_buf0[(0)] = __hip_ds_bpermutef(((__mbcnt_hi(-1, __mbcnt_lo(-1, 0)) & (~63)) << 2), red_buf0[(0)]);
  if (((int)threadIdx.x) == 0) {
    T_dense[(0)] = red_buf0[(0)];
  }
  if (((int)threadIdx.x) == 0) {
    T_add[(((int)blockIdx.x))] = (T_dense[(0)] + placeholder2[(((int)blockIdx.x))]);
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_multiply_add_nn_re_11882905421691233276__kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 24576))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 98304))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 122880))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      if (((((((int)threadIdx.x) & 15) >> 2) * 2) + ax2_inner) < 7) {
        if ((((((int)threadIdx.x) & 3) * 2) + ax3_inner) < 7) {
          T_relu[(((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (ax2_inner * 7)) + ((((int)threadIdx.x) & 3) * 2)) + ax3_inner))] = max(__ocml_fma_f32((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[(((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (ax2_inner * 7)) + ((((int)threadIdx.x) & 3) * 2)) + ax3_inner))]), placeholder1[(((((int)blockIdx.x) * 8) + (((int)threadIdx.x) >> 4)))], placeholder2[(((((int)blockIdx.x) * 8) + (((int)threadIdx.x) >> 4)))]), 0.000000e+00f);
        }
      }
    }
  }
}

extern "C" __global__ void fused_nn_conv2d_add_nn_relu_3_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_relu, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute[16];
  __shared__ float pad_temp_shared[793];
  __shared__ float placeholder_shared[3136];
  for (int ff_init = 0; ff_init < 4; ++ff_init) {
    for (int xx_init = 0; xx_init < 4; ++xx_init) {
      compute[(((ff_init * 4) + xx_init))] = 0.000000e+00f;
    }
  }
  for (int rc_outer = 0; rc_outer < 3; ++rc_outer) {
    __syncthreads();
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 2; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      if (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 793) {
        if ((((((int)threadIdx.y) * 13) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 50) {
          if (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 13) {
            pad_temp_shared[(((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = (((((3 <= ((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 61))) && (((((int)blockIdx.y) * 8) + (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 61)) < 227)) && (3 <= ((((int)blockIdx.x) * 56) + (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 61)))) && (((((int)blockIdx.x) * 56) + (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 61)) < 227)) ? placeholder[(((((((rc_outer * 50176) + (((int)blockIdx.y) * 1792)) + ((((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) / 61) * 224)) + (((int)blockIdx.x) * 56)) + (((((((int)threadIdx.z) * 50) + (((int)threadIdx.y) * 13)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) % 61)) - 675))] : 0.000000e+00f);
          }
        }
      }
    }
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 7; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
      placeholder_shared[(((((((int)threadIdx.z) * 196) + (((int)threadIdx.y) * 49)) + (((int)threadIdx.x) * 7)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = placeholder1[((((((((int)threadIdx.z) * 588) + (((int)threadIdx.y) * 147)) + (rc_outer * 49)) + (((int)threadIdx.x) * 7)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))];
    }
    __syncthreads();
    for (int ry_inner = 0; ry_inner < 7; ++ry_inner) {
      for (int rx_inner = 0; rx_inner < 7; ++rx_inner) {
        for (int ff = 0; ff < 4; ++ff) {
          for (int xx = 0; xx < 4; ++xx) {
            compute[(((ff * 4) + xx))] = __ocml_fma_f32(pad_temp_shared[((((((((int)threadIdx.y) * 122) + (ry_inner * 61)) + (((int)threadIdx.x) * 8)) + (xx * 2)) + rx_inner))], placeholder_shared[(((((((int)threadIdx.z) * 196) + (ff * 49)) + (ry_inner * 7)) + rx_inner))], compute[(((ff * 4) + xx))]);
          }
        }
      }
    }
  }
  for (int ax1_inner_inner_inner = 0; ax1_inner_inner_inner < 4; ++ax1_inner_inner_inner) {
    for (int ax3_inner_inner_inner = 0; ax3_inner_inner_inner < 4; ++ax3_inner_inner_inner) {
      T_relu[((((((((((int)threadIdx.z) * 50176) + (ax1_inner_inner_inner * 12544)) + (((int)blockIdx.y) * 448)) + (((int)threadIdx.y) * 112)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 4)) + ax3_inner_inner_inner))] = max((compute[(((ax1_inner_inner_inner * 4) + ax3_inner_inner_inner))] + placeholder2[(((((int)threadIdx.z) * 4) + ax1_inner_inner_inner))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_conv2d_2_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute_local[1];
  __shared__ float pad_temp_shared[432];
  __shared__ float placeholder_shared[512];
  compute_local[(0)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 8; ++rc_outer) {
    __syncthreads();
    if (((((int)threadIdx.z) * 14) + ((int)threadIdx.x)) < 432) {
      pad_temp_shared[(((((int)threadIdx.z) * 14) + ((int)threadIdx.x)))] = placeholder[(((((rc_outer * 12544) + ((((((int)threadIdx.z) * 14) + ((int)threadIdx.x)) / 27) * 784)) + (((int)blockIdx.y) * 56)) + (((((int)threadIdx.z) * 14) + ((int)threadIdx.x)) % 27)))];
    }
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 2; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      if (((((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) >> 4) + ((int)threadIdx.z)) < 32) {
        if ((((((int)threadIdx.z) * 16) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 512) {
          if (((((int)threadIdx.x) * 2) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) < 16) {
            placeholder_shared[((((((int)threadIdx.z) * 16) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = placeholder1[((((((((int)blockIdx.z) * 4096) + (((int)threadIdx.z) * 128)) + (rc_outer * 16)) + (((int)threadIdx.x) * 2)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))];
          }
        }
      }
    }
    __syncthreads();
    for (int rc_inner = 0; rc_inner < 16; ++rc_inner) {
      compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[(((rc_inner * 27) + (((int)threadIdx.x) * 2)))], placeholder_shared[(((((int)threadIdx.z) * 16) + rc_inner))], compute_local[(0)]);
    }
  }
  compute[(((((((int)blockIdx.z) * 6272) + (((int)threadIdx.z) * 196)) + (((int)blockIdx.y) * 14)) + ((int)threadIdx.x)))] = compute_local[(0)];
}

extern "C" __global__ void fused_add_nn_relu_1_kernel0(float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  T_relu[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] = max((placeholder[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] + placeholder1[((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) / 196))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_multiply_add_nn_re_11882905421691233276__kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[1024];
  __shared__ float data_pack_shared[256];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 32; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 256))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 2048))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 512))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 4096))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 768))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 6144))];
    data_pack_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 8192) + (ci_outer * 256)) + (((int)threadIdx.y) * 8)) + ((int)threadIdx.x)))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 16))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 17))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps) < 15)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu) < 15)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (eps * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + nu) - 15))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 50176) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_batch_flatten_kernel0(float* __restrict__ tensor, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  tensor[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] = placeholder[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))];
}

extern "C" __global__ void fused_nn_conv2d_add_nn_relu_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ T_relu, float* __restrict__ placeholder2) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute[1];
  __shared__ float pad_temp_shared[180];
  __shared__ float placeholder_shared[1152];
  compute[(0)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 64; ++rc_outer) {
    __syncthreads();
    if (((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) < 180) {
      if (((int)threadIdx.x) < 6) {
        pad_temp_shared[(((((int)threadIdx.z) * 6) + ((int)threadIdx.x)))] = (((1 <= ((((int)blockIdx.y) * 2) + ((((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) % 45) / 15))) && (1 <= (((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) % 15))) ? placeholder[(((((((rc_outer * 784) + ((((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) / 45) * 196)) + (((int)blockIdx.y) * 28)) + (((((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) % 45) / 15) * 14)) + (((((int)threadIdx.z) * 6) + ((int)threadIdx.x)) % 15)) - 15))] : 0.000000e+00f);
      }
    }
    if (((((int)threadIdx.x) / 6) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + ((((int)threadIdx.x) * 2) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 384) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1152) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[(((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)))] = placeholder1[(((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.x) / 6) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + ((((int)threadIdx.x) * 2) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 384) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1151) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[((((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) + 1))] = placeholder1[((((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)) + 1))];
            }
          }
        }
      }
    }
    if (((((int)threadIdx.x) / 6) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + ((((int)threadIdx.x) * 2) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 384) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1150) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[((((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) + 2))] = placeholder1[((((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)) + 2))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 383) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1149) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[((((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) + 3))] = placeholder1[((((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)) + 3))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 383) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1148) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[((((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) + 4))] = placeholder1[((((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)) + 4))];
            }
          }
        }
      }
    }
    if (((((((int)threadIdx.x) * 2) + 1) / 12) + ((int)threadIdx.z)) < 32) {
      if (((((int)threadIdx.z) * 4) + (((((int)threadIdx.x) * 2) + 1) / 3)) < 128) {
        if (((((int)threadIdx.z) * 12) + (((int)threadIdx.x) * 2)) < 383) {
          if (((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) < 1147) {
            if (((int)threadIdx.x) < 6) {
              placeholder_shared[((((((int)threadIdx.z) * 36) + (((int)threadIdx.x) * 6)) + 5))] = placeholder1[((((((((int)blockIdx.z) * 73728) + (((int)threadIdx.z) * 2304)) + (rc_outer * 36)) + (((int)threadIdx.x) * 6)) + 5))];
            }
          }
        }
      }
    }
    __syncthreads();
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[((((int)threadIdx.x) * 2))], placeholder_shared[((((int)threadIdx.z) * 36))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 1))], placeholder_shared[(((((int)threadIdx.z) * 36) + 1))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 2))], placeholder_shared[(((((int)threadIdx.z) * 36) + 2))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 15))], placeholder_shared[(((((int)threadIdx.z) * 36) + 3))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 16))], placeholder_shared[(((((int)threadIdx.z) * 36) + 4))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 17))], placeholder_shared[(((((int)threadIdx.z) * 36) + 5))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 30))], placeholder_shared[(((((int)threadIdx.z) * 36) + 6))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 31))], placeholder_shared[(((((int)threadIdx.z) * 36) + 7))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 32))], placeholder_shared[(((((int)threadIdx.z) * 36) + 8))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 45))], placeholder_shared[(((((int)threadIdx.z) * 36) + 9))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 46))], placeholder_shared[(((((int)threadIdx.z) * 36) + 10))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 47))], placeholder_shared[(((((int)threadIdx.z) * 36) + 11))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 60))], placeholder_shared[(((((int)threadIdx.z) * 36) + 12))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 61))], placeholder_shared[(((((int)threadIdx.z) * 36) + 13))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 62))], placeholder_shared[(((((int)threadIdx.z) * 36) + 14))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 75))], placeholder_shared[(((((int)threadIdx.z) * 36) + 15))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 76))], placeholder_shared[(((((int)threadIdx.z) * 36) + 16))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 77))], placeholder_shared[(((((int)threadIdx.z) * 36) + 17))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 90))], placeholder_shared[(((((int)threadIdx.z) * 36) + 18))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 91))], placeholder_shared[(((((int)threadIdx.z) * 36) + 19))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 92))], placeholder_shared[(((((int)threadIdx.z) * 36) + 20))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 105))], placeholder_shared[(((((int)threadIdx.z) * 36) + 21))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 106))], placeholder_shared[(((((int)threadIdx.z) * 36) + 22))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 107))], placeholder_shared[(((((int)threadIdx.z) * 36) + 23))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 120))], placeholder_shared[(((((int)threadIdx.z) * 36) + 24))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 121))], placeholder_shared[(((((int)threadIdx.z) * 36) + 25))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 122))], placeholder_shared[(((((int)threadIdx.z) * 36) + 26))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 135))], placeholder_shared[(((((int)threadIdx.z) * 36) + 27))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 136))], placeholder_shared[(((((int)threadIdx.z) * 36) + 28))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 137))], placeholder_shared[(((((int)threadIdx.z) * 36) + 29))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 150))], placeholder_shared[(((((int)threadIdx.z) * 36) + 30))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 151))], placeholder_shared[(((((int)threadIdx.z) * 36) + 31))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 152))], placeholder_shared[(((((int)threadIdx.z) * 36) + 32))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 165))], placeholder_shared[(((((int)threadIdx.z) * 36) + 33))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 166))], placeholder_shared[(((((int)threadIdx.z) * 36) + 34))], compute[(0)]);
    compute[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.x) * 2) + 167))], placeholder_shared[(((((int)threadIdx.z) * 36) + 35))], compute[(0)]);
  }
  T_relu[(((((((int)blockIdx.z) * 1568) + (((int)threadIdx.z) * 49)) + (((int)blockIdx.y) * 7)) + ((int)threadIdx.x)))] = max((compute[(0)] + placeholder2[(((((int)blockIdx.z) * 32) + ((int)threadIdx.z)))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_1_kernel2(float* __restrict__ bgemm, float* __restrict__ T_relu, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_relu[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (ax2_inner * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + ax3_inner))] = max((inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 49))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_1_kernel2(float* __restrict__ bgemm, float* __restrict__ T_add, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 12544))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 25088))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 37632))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 50176))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 100352))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 150528))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 62720))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 75264))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 87808))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 112896))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 125440))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 137984))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 163072))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 175616))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 188160))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      T_add[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (ax2_inner * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + ax3_inner))] = (inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (ax2_inner * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + ax3_inner))]);
    }
  }
}

extern "C" __global__ void fused_add_nn_relu_2_kernel0(float* __restrict__ T_relu, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_outer = 0; ax0_ax1_fused_ax2_fused_ax3_fused_outer < 2; ++ax0_ax1_fused_ax2_fused_ax3_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) < 100352) {
      T_relu[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] = max((placeholder[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) / 784))]), 0.000000e+00f);
    }
  }
}

extern "C" __global__ void fused_nn_conv2d_3_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute_local[7];
  __shared__ float pad_temp_shared[416];
  __shared__ float placeholder_shared[1024];
  for (int xx_c_init = 0; xx_c_init < 7; ++xx_c_init) {
    compute_local[(xx_c_init)] = 0.000000e+00f;
  }
  for (int rc_outer = 0; rc_outer < 8; ++rc_outer) {
    __syncthreads();
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner < 13; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner) {
      pad_temp_shared[(((((int)threadIdx.z) * 13) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))] = placeholder[(((((rc_outer * 6272) + (((int)threadIdx.z) * 196)) + (((int)blockIdx.y) * 28)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner))];
    }
    for (int ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 = 0; ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1 < 32; ++ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1) {
      placeholder_shared[(((((int)threadIdx.z) * 32) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))] = placeholder1[(((((((int)blockIdx.z) * 8192) + (((int)threadIdx.z) * 256)) + (rc_outer * 32)) + ax0_ax1_fused_ax2_fused_ax3_fused_inner_inner_inner1))];
    }
    __syncthreads();
    for (int rc_inner = 0; rc_inner < 32; ++rc_inner) {
      for (int xx_c = 0; xx_c < 7; ++xx_c) {
        compute_local[(xx_c)] = __ocml_fma_f32(pad_temp_shared[(((rc_inner * 13) + (xx_c * 2)))], placeholder_shared[(((((int)threadIdx.z) * 32) + rc_inner))], compute_local[(xx_c)]);
      }
    }
  }
  for (int xx_inner_inner_inner = 0; xx_inner_inner_inner < 7; ++xx_inner_inner_inner) {
    compute[(((((((int)blockIdx.z) * 1568) + (((int)threadIdx.z) * 49)) + (((int)blockIdx.y) * 7)) + xx_inner_inner_inner))] = compute_local[(xx_inner_inner_inner)];
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[1024];
  __shared__ float data_pack_shared[256];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 32; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 256))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 2048))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 512))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 4096))];
    placeholder_shared[((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) + 768))] = placeholder[(((((((((int)blockIdx.z) * 262144) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) >> 6) * 512)) + (((int)blockIdx.y) * 64)) + (((((int)threadIdx.y) * 8) + ((int)threadIdx.x)) & 63)) + 6144))];
    data_pack_shared[(((((int)threadIdx.y) * 8) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 8192) + (ci_outer * 256)) + (((int)threadIdx.y) * 8)) + ((int)threadIdx.x)))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 16))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 17))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 32))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 33))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 48))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 64))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 65))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 80))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 81))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 96))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 97))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 128))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 129))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 144))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 145))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 160))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 161))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 177))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 192))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 193))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 208))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 209))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 240))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 241))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 16))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 8192) + (((int)blockIdx.y) * 1024)) + (((int)threadIdx.y) * 32)) + (((int)threadIdx.x) * 2)) + 17))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_max_pool2d_add_nn_relu_kernel0(float* __restrict__ placeholder, float* __restrict__ T_relu, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float tensor[1];
  tensor[(0)] = -3.402823e+38f;
  for (int dh = 0; dh < 3; ++dh) {
    for (int dw = 0; dw < 3; ++dw) {
      tensor[(0)] = max(tensor[(0)], (((1 <= ((((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) % 3136) / 56) * 2) + dh)) && (1 <= (((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) % 56) * 2) + dw))) ? placeholder[(((((((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) / 56) * 224) + (dh * 112)) + ((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) % 56) * 2)) + dw) - 113))] : -3.402823e+38f));
    }
  }
  T_relu[(((((int)blockIdx.x) * 256) + ((int)threadIdx.x)))] = max((tensor[(0)] + placeholder1[((((((int)blockIdx.x) * 256) + ((int)threadIdx.x)) / 3136))]), 0.000000e+00f);
}

extern "C" __global__ void fused_nn_conv2d_kernel0(float* __restrict__ placeholder, float* __restrict__ placeholder1, float* __restrict__ compute) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float compute_local[4];
  __shared__ float pad_temp_shared[256];
  __shared__ float placeholder_shared[512];
  compute_local[(0)] = 0.000000e+00f;
  compute_local[(2)] = 0.000000e+00f;
  compute_local[(1)] = 0.000000e+00f;
  compute_local[(3)] = 0.000000e+00f;
  for (int rc_outer = 0; rc_outer < 4; ++rc_outer) {
    __syncthreads();
    pad_temp_shared[((((((int)threadIdx.z) * 16) + (((int)threadIdx.y) * 8)) + (((int)threadIdx.x) * 2)))] = placeholder[(((((((rc_outer * 50176) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)))];
    pad_temp_shared[(((((((int)threadIdx.z) * 16) + (((int)threadIdx.y) * 8)) + (((int)threadIdx.x) * 2)) + 1))] = placeholder[((((((((rc_outer * 50176) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + 1))];
    placeholder_shared[((((((int)threadIdx.z) * 32) + (((int)threadIdx.y) * 16)) + (((int)threadIdx.x) * 4)))] = placeholder1[((((((((int)blockIdx.z) * 2048) + (((int)threadIdx.z) * 128)) + (((int)threadIdx.y) * 64)) + (rc_outer * 16)) + (((int)threadIdx.x) * 4)))];
    placeholder_shared[(((((((int)threadIdx.z) * 32) + (((int)threadIdx.y) * 16)) + (((int)threadIdx.x) * 4)) + 1))] = placeholder1[(((((((((int)blockIdx.z) * 2048) + (((int)threadIdx.z) * 128)) + (((int)threadIdx.y) * 64)) + (rc_outer * 16)) + (((int)threadIdx.x) * 4)) + 1))];
    placeholder_shared[(((((((int)threadIdx.z) * 32) + (((int)threadIdx.y) * 16)) + (((int)threadIdx.x) * 4)) + 2))] = placeholder1[(((((((((int)blockIdx.z) * 2048) + (((int)threadIdx.z) * 128)) + (((int)threadIdx.y) * 64)) + (rc_outer * 16)) + (((int)threadIdx.x) * 4)) + 2))];
    placeholder_shared[(((((((int)threadIdx.z) * 32) + (((int)threadIdx.y) * 16)) + (((int)threadIdx.x) * 4)) + 3))] = placeholder1[(((((((((int)blockIdx.z) * 2048) + (((int)threadIdx.z) * 128)) + (((int)threadIdx.y) * 64)) + (rc_outer * 16)) + (((int)threadIdx.x) * 4)) + 3))];
    __syncthreads();
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)))], placeholder_shared[((((int)threadIdx.z) * 16))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[(((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)))], placeholder_shared[(((((int)threadIdx.z) * 16) + 256))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 1))], placeholder_shared[((((int)threadIdx.z) * 16))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 1))], placeholder_shared[(((((int)threadIdx.z) * 16) + 256))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 16))], placeholder_shared[(((((int)threadIdx.z) * 16) + 1))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 16))], placeholder_shared[(((((int)threadIdx.z) * 16) + 257))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 17))], placeholder_shared[(((((int)threadIdx.z) * 16) + 1))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 17))], placeholder_shared[(((((int)threadIdx.z) * 16) + 257))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 32))], placeholder_shared[(((((int)threadIdx.z) * 16) + 2))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 32))], placeholder_shared[(((((int)threadIdx.z) * 16) + 258))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 33))], placeholder_shared[(((((int)threadIdx.z) * 16) + 2))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 33))], placeholder_shared[(((((int)threadIdx.z) * 16) + 258))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 48))], placeholder_shared[(((((int)threadIdx.z) * 16) + 3))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 48))], placeholder_shared[(((((int)threadIdx.z) * 16) + 259))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 49))], placeholder_shared[(((((int)threadIdx.z) * 16) + 3))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 49))], placeholder_shared[(((((int)threadIdx.z) * 16) + 259))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 64))], placeholder_shared[(((((int)threadIdx.z) * 16) + 4))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 64))], placeholder_shared[(((((int)threadIdx.z) * 16) + 260))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 65))], placeholder_shared[(((((int)threadIdx.z) * 16) + 4))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 65))], placeholder_shared[(((((int)threadIdx.z) * 16) + 260))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 80))], placeholder_shared[(((((int)threadIdx.z) * 16) + 5))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 80))], placeholder_shared[(((((int)threadIdx.z) * 16) + 261))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 81))], placeholder_shared[(((((int)threadIdx.z) * 16) + 5))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 81))], placeholder_shared[(((((int)threadIdx.z) * 16) + 261))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 96))], placeholder_shared[(((((int)threadIdx.z) * 16) + 6))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 96))], placeholder_shared[(((((int)threadIdx.z) * 16) + 262))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 97))], placeholder_shared[(((((int)threadIdx.z) * 16) + 6))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 97))], placeholder_shared[(((((int)threadIdx.z) * 16) + 262))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 112))], placeholder_shared[(((((int)threadIdx.z) * 16) + 7))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 112))], placeholder_shared[(((((int)threadIdx.z) * 16) + 263))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 113))], placeholder_shared[(((((int)threadIdx.z) * 16) + 7))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 113))], placeholder_shared[(((((int)threadIdx.z) * 16) + 263))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 128))], placeholder_shared[(((((int)threadIdx.z) * 16) + 8))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 128))], placeholder_shared[(((((int)threadIdx.z) * 16) + 264))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 129))], placeholder_shared[(((((int)threadIdx.z) * 16) + 8))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 129))], placeholder_shared[(((((int)threadIdx.z) * 16) + 264))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 144))], placeholder_shared[(((((int)threadIdx.z) * 16) + 9))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 144))], placeholder_shared[(((((int)threadIdx.z) * 16) + 265))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 145))], placeholder_shared[(((((int)threadIdx.z) * 16) + 9))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 145))], placeholder_shared[(((((int)threadIdx.z) * 16) + 265))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 160))], placeholder_shared[(((((int)threadIdx.z) * 16) + 10))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 160))], placeholder_shared[(((((int)threadIdx.z) * 16) + 266))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 161))], placeholder_shared[(((((int)threadIdx.z) * 16) + 10))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 161))], placeholder_shared[(((((int)threadIdx.z) * 16) + 266))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 176))], placeholder_shared[(((((int)threadIdx.z) * 16) + 11))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 176))], placeholder_shared[(((((int)threadIdx.z) * 16) + 267))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 177))], placeholder_shared[(((((int)threadIdx.z) * 16) + 11))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 177))], placeholder_shared[(((((int)threadIdx.z) * 16) + 267))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 192))], placeholder_shared[(((((int)threadIdx.z) * 16) + 12))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 192))], placeholder_shared[(((((int)threadIdx.z) * 16) + 268))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 193))], placeholder_shared[(((((int)threadIdx.z) * 16) + 12))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 193))], placeholder_shared[(((((int)threadIdx.z) * 16) + 268))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 208))], placeholder_shared[(((((int)threadIdx.z) * 16) + 13))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 208))], placeholder_shared[(((((int)threadIdx.z) * 16) + 269))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 209))], placeholder_shared[(((((int)threadIdx.z) * 16) + 13))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 209))], placeholder_shared[(((((int)threadIdx.z) * 16) + 269))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 224))], placeholder_shared[(((((int)threadIdx.z) * 16) + 14))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 224))], placeholder_shared[(((((int)threadIdx.z) * 16) + 270))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 225))], placeholder_shared[(((((int)threadIdx.z) * 16) + 14))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 225))], placeholder_shared[(((((int)threadIdx.z) * 16) + 270))], compute_local[(3)]);
    compute_local[(0)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 240))], placeholder_shared[(((((int)threadIdx.z) * 16) + 15))], compute_local[(0)]);
    compute_local[(2)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 240))], placeholder_shared[(((((int)threadIdx.z) * 16) + 271))], compute_local[(2)]);
    compute_local[(1)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 241))], placeholder_shared[(((((int)threadIdx.z) * 16) + 15))], compute_local[(1)]);
    compute_local[(3)] = __ocml_fma_f32(pad_temp_shared[((((((int)threadIdx.y) * 8) + (((int)threadIdx.x) * 2)) + 241))], placeholder_shared[(((((int)threadIdx.z) * 16) + 271))], compute_local[(3)]);
  }
  compute[(((((((((int)blockIdx.z) * 100352) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)))] = compute_local[(0)];
  compute[((((((((((int)blockIdx.z) * 100352) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + 50176))] = compute_local[(2)];
  compute[((((((((((int)blockIdx.z) * 100352) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + 1))] = compute_local[(1)];
  compute[((((((((((int)blockIdx.z) * 100352) + (((int)threadIdx.z) * 3136)) + (((int)blockIdx.y) * 112)) + (((int)threadIdx.y) * 56)) + (((int)blockIdx.x) * 8)) + (((int)threadIdx.x) * 2)) + 50177))] = compute_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_3_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[2048];
  __shared__ float data_pack_shared[896];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 2; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = placeholder[((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 448))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 896))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 896))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1344))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1344))];
    if (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) < 256) {
      if (((int)threadIdx.y) < 19) {
        placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1792))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1792))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)))];
    data_pack_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = data_pack[(((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)) + 3136))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 196))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 197))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_add_nn_relu_2_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[2048];
  __shared__ float data_pack_shared[896];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 2; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = placeholder[((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 448))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 896))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 896))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1344))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1344))];
    if (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) < 256) {
      if (((int)threadIdx.y) < 19) {
        placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1792))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1792))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)))];
    data_pack_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = data_pack[(((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)) + 3136))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 196))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 197))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_kernel2(float* __restrict__ bgemm, float* __restrict__ T_add, float* __restrict__ placeholder) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float inverse[4];
  inverse[(0)] = 0.000000e+00f;
  inverse[(0)] = (inverse[(0)] + bgemm[(((((int)blockIdx.x) * 128) + ((int)threadIdx.x)))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(0)] = (inverse[(0)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = 0.000000e+00f;
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 8192))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 16384))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 24576))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))]);
  inverse[(1)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(1)]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(1)] = (inverse[(1)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(2)] = 0.000000e+00f;
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 32768))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(2)]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 65536))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 98304))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))]);
  inverse[(2)] = (inverse[(2)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = 0.000000e+00f;
  inverse[(3)] = __ocml_fma_f32((bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 40960))] * -1.000000e+00f), -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 49152))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 57344))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 73728))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 81920))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 90112))]);
  inverse[(3)] = __ocml_fma_f32(bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 106496))], -1.000000e+00f, inverse[(3)]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 114688))]);
  inverse[(3)] = (inverse[(3)] + bgemm[((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) + 122880))]);
  for (int ax2_inner = 0; ax2_inner < 2; ++ax2_inner) {
    for (int ax3_inner = 0; ax3_inner < 2; ++ax3_inner) {
      if (((((((int)threadIdx.x) & 15) >> 2) * 2) + ax2_inner) < 7) {
        if ((((((int)threadIdx.x) & 3) * 2) + ax3_inner) < 7) {
          T_add[(((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (ax2_inner * 7)) + ((((int)threadIdx.x) & 3) * 2)) + ax3_inner))] = (inverse[(((ax2_inner * 2) + ax3_inner))] + placeholder[(((((((((int)blockIdx.x) * 392) + ((((int)threadIdx.x) >> 4) * 49)) + (((((int)threadIdx.x) & 15) >> 2) * 14)) + (ax2_inner * 7)) + ((((int)threadIdx.x) & 3) * 2)) + ax3_inner))]);
        }
      }
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_3_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[2048];
  __shared__ float data_pack_shared[896];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 2; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = placeholder[((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 448))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 896))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 896))];
    placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1344))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1344))];
    if (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) < 256) {
      if (((int)threadIdx.y) < 19) {
        placeholder_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 1792))] = placeholder[(((((((int)blockIdx.z) * 4096) + (ci_outer * 2048)) + ((((int)threadIdx.y) * 14) + ((int)threadIdx.x))) + 1792))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 14) + ((int)threadIdx.x)))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)))];
    data_pack_shared[((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) + 448))] = data_pack[(((((((((int)blockIdx.z) * 12544) + (ci_outer * 6272)) + ((((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) / 28) * 196)) + (((int)blockIdx.x) * 28)) + (((((int)threadIdx.y) * 14) + ((int)threadIdx.x)) % 28)) + 3136))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 2))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[((((int)threadIdx.x) * 2))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1))], data_pack_shared[(((((int)threadIdx.x) * 2) + 1))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 64))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 28))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 65))], data_pack_shared[(((((int)threadIdx.x) * 2) + 29))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 128))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 56))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 129))], data_pack_shared[(((((int)threadIdx.x) * 2) + 57))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 192))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 84))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 193))], data_pack_shared[(((((int)threadIdx.x) * 2) + 85))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 256))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 112))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 257))], data_pack_shared[(((((int)threadIdx.x) * 2) + 113))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 320))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 140))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 321))], data_pack_shared[(((((int)threadIdx.x) * 2) + 141))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 384))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 168))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 385))], data_pack_shared[(((((int)threadIdx.x) * 2) + 169))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 448))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 449))], data_pack_shared[(((((int)threadIdx.x) * 2) + 197))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 512))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 224))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 513))], data_pack_shared[(((((int)threadIdx.x) * 2) + 225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 576))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 252))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 577))], data_pack_shared[(((((int)threadIdx.x) * 2) + 253))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 640))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 280))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 641))], data_pack_shared[(((((int)threadIdx.x) * 2) + 281))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 704))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 308))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 705))], data_pack_shared[(((((int)threadIdx.x) * 2) + 309))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 768))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 336))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 769))], data_pack_shared[(((((int)threadIdx.x) * 2) + 337))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 832))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 364))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 833))], data_pack_shared[(((((int)threadIdx.x) * 2) + 365))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 896))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 897))], data_pack_shared[(((((int)threadIdx.x) * 2) + 393))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 960))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 420))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 961))], data_pack_shared[(((((int)threadIdx.x) * 2) + 421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1024))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 448))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1025))], data_pack_shared[(((((int)threadIdx.x) * 2) + 449))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1088))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 476))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1089))], data_pack_shared[(((((int)threadIdx.x) * 2) + 477))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1152))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 504))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1153))], data_pack_shared[(((((int)threadIdx.x) * 2) + 505))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1216))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 532))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1217))], data_pack_shared[(((((int)threadIdx.x) * 2) + 533))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1280))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 560))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1281))], data_pack_shared[(((((int)threadIdx.x) * 2) + 561))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1344))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1345))], data_pack_shared[(((((int)threadIdx.x) * 2) + 589))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1408))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 616))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1409))], data_pack_shared[(((((int)threadIdx.x) * 2) + 617))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1472))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 644))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1473))], data_pack_shared[(((((int)threadIdx.x) * 2) + 645))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1536))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 672))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1537))], data_pack_shared[(((((int)threadIdx.x) * 2) + 673))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1600))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 700))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1601))], data_pack_shared[(((((int)threadIdx.x) * 2) + 701))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1664))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 728))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1665))], data_pack_shared[(((((int)threadIdx.x) * 2) + 729))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1728))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 756))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1729))], data_pack_shared[(((((int)threadIdx.x) * 2) + 757))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1792))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1793))], data_pack_shared[(((((int)threadIdx.x) * 2) + 785))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1856))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 812))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1857))], data_pack_shared[(((((int)threadIdx.x) * 2) + 813))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1920))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 840))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1921))], data_pack_shared[(((((int)threadIdx.x) * 2) + 841))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1984))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 868))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 2) + 1985))], data_pack_shared[(((((int)threadIdx.x) * 2) + 869))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 1))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 196))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)threadIdx.y) * 392)) + (((int)blockIdx.x) * 28)) + (((int)threadIdx.x) * 2)) + 197))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_1_kernel1(float* __restrict__ placeholder, float* __restrict__ data_pack, float* __restrict__ bgemm) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float bgemm_local[4];
  __shared__ float placeholder_shared[512];
  __shared__ float data_pack_shared[1568];
  bgemm_local[(0)] = 0.000000e+00f;
  bgemm_local[(1)] = 0.000000e+00f;
  bgemm_local[(2)] = 0.000000e+00f;
  bgemm_local[(3)] = 0.000000e+00f;
  for (int ci_outer = 0; ci_outer < 8; ++ci_outer) {
    __syncthreads();
    placeholder_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) & 15)))];
    placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 4) & 15)))];
    if (((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) < 120) {
      if (((int)threadIdx.y) < 3) {
        placeholder_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = placeholder[((((((((int)blockIdx.z) * 65536) + (ci_outer * 8192)) + (((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392) >> 4) * 256)) + (((int)blockIdx.y) * 16)) + ((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 8) & 15)))];
      }
    }
    data_pack_shared[(((((int)threadIdx.y) * 49) + ((int)threadIdx.x)))] = data_pack[(((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 196))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 196))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 392))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 392))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 588))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 588))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 784))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 784))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 980))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 980))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1176))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1176))];
    data_pack_shared[((((((int)threadIdx.y) * 49) + ((int)threadIdx.x)) + 1372))] = data_pack[((((((((int)blockIdx.z) * 12544) + (ci_outer * 1568)) + (((int)threadIdx.y) * 49)) + ((int)threadIdx.x)) + 1372))];
    __syncthreads();
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[((((int)threadIdx.y) * 4))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 1))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 2))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 3))], data_pack_shared[(((int)threadIdx.x))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 16))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 17))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 18))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 19))], data_pack_shared[((((int)threadIdx.x) + 49))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 32))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 33))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 34))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 35))], data_pack_shared[((((int)threadIdx.x) + 98))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 48))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 49))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 50))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 51))], data_pack_shared[((((int)threadIdx.x) + 147))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 64))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 65))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 66))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 67))], data_pack_shared[((((int)threadIdx.x) + 196))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 80))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 81))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 82))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 83))], data_pack_shared[((((int)threadIdx.x) + 245))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 96))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 97))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 98))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 99))], data_pack_shared[((((int)threadIdx.x) + 294))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 112))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 113))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 114))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 115))], data_pack_shared[((((int)threadIdx.x) + 343))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 128))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 129))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 130))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 131))], data_pack_shared[((((int)threadIdx.x) + 392))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 144))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 145))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 146))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 147))], data_pack_shared[((((int)threadIdx.x) + 441))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 160))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 161))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 162))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 163))], data_pack_shared[((((int)threadIdx.x) + 490))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 176))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 177))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 178))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 179))], data_pack_shared[((((int)threadIdx.x) + 539))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 192))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 193))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 194))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 195))], data_pack_shared[((((int)threadIdx.x) + 588))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 208))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 209))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 210))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 211))], data_pack_shared[((((int)threadIdx.x) + 637))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 224))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 225))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 226))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 227))], data_pack_shared[((((int)threadIdx.x) + 686))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 240))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 241))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 242))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 243))], data_pack_shared[((((int)threadIdx.x) + 735))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 256))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 257))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 258))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 259))], data_pack_shared[((((int)threadIdx.x) + 784))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 272))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 273))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 274))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 275))], data_pack_shared[((((int)threadIdx.x) + 833))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 288))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 289))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 290))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 291))], data_pack_shared[((((int)threadIdx.x) + 882))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 304))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 305))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 306))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 307))], data_pack_shared[((((int)threadIdx.x) + 931))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 320))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 321))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 322))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 323))], data_pack_shared[((((int)threadIdx.x) + 980))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 336))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 337))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 338))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 339))], data_pack_shared[((((int)threadIdx.x) + 1029))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 352))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 353))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 354))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 355))], data_pack_shared[((((int)threadIdx.x) + 1078))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 368))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 369))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 370))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 371))], data_pack_shared[((((int)threadIdx.x) + 1127))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 384))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 385))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 386))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 387))], data_pack_shared[((((int)threadIdx.x) + 1176))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 400))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 401))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 402))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 403))], data_pack_shared[((((int)threadIdx.x) + 1225))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 416))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 417))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 418))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 419))], data_pack_shared[((((int)threadIdx.x) + 1274))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 432))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 433))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 434))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 435))], data_pack_shared[((((int)threadIdx.x) + 1323))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 448))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 449))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 450))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 451))], data_pack_shared[((((int)threadIdx.x) + 1372))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 464))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 465))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 466))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 467))], data_pack_shared[((((int)threadIdx.x) + 1421))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 480))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 481))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 482))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 483))], data_pack_shared[((((int)threadIdx.x) + 1470))], bgemm_local[(3)]);
    bgemm_local[(0)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 496))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(0)]);
    bgemm_local[(1)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 497))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(1)]);
    bgemm_local[(2)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 498))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(2)]);
    bgemm_local[(3)] = __ocml_fma_f32(placeholder_shared[(((((int)threadIdx.y) * 4) + 499))], data_pack_shared[((((int)threadIdx.x) + 1519))], bgemm_local[(3)]);
  }
  bgemm[(((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)))] = bgemm_local[(0)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 49))] = bgemm_local[(1)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 98))] = bgemm_local[(2)];
  bgemm[((((((((int)blockIdx.z) * 12544) + (((int)blockIdx.y) * 784)) + (((int)threadIdx.y) * 196)) + ((int)threadIdx.x)) + 147))] = bgemm_local[(3)];
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_nn_relu_1_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 49) / 7) * 2) + eps) < 15)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2) + nu) < 15)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 7) * 28) + (eps * 14)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 7) * 2)) + nu) - 15))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 50176) + (nu1 * 12544)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_nn_contrib_conv2d_winograd_without_weight_transform_add_2_kernel0(float* __restrict__ placeholder, float* __restrict__ data_pack) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  float d[16];
  float data_pack_local[16];
  for (int eps = 0; eps < 4; ++eps) {
    for (int nu = 0; nu < 4; ++nu) {
      d[(((eps * 4) + nu))] = (((((1 <= ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps)) && (((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 196) / 14) * 2) + eps) < 29)) && (1 <= (((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu))) && ((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2) + nu) < 29)) ? placeholder[(((((((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) / 14) * 56) + (eps * 28)) + ((((((int)blockIdx.x) * 128) + ((int)threadIdx.x)) % 14) * 2)) + nu) - 29))] : 0.000000e+00f);
    }
  }
  data_pack_local[(0)] = 0.000000e+00f;
  data_pack_local[(0)] = (data_pack_local[(0)] + d[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(2)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32(d[(8)], -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(0)] = __ocml_fma_f32((d[(10)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(0)]);
  data_pack_local[(1)] = 0.000000e+00f;
  data_pack_local[(1)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = (data_pack_local[(1)] + d[(2)]);
  data_pack_local[(1)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(1)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(1)]);
  data_pack_local[(2)] = 0.000000e+00f;
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(1)]);
  data_pack_local[(2)] = (data_pack_local[(2)] + d[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(2)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(2)]);
  data_pack_local[(3)] = 0.000000e+00f;
  data_pack_local[(3)] = __ocml_fma_f32(d[(1)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = (data_pack_local[(3)] + d[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32((d[(9)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(3)] = __ocml_fma_f32(d[(11)], -1.000000e+00f, data_pack_local[(3)]);
  data_pack_local[(4)] = 0.000000e+00f;
  data_pack_local[(4)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(4)] = (data_pack_local[(4)] + d[(8)]);
  data_pack_local[(4)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(4)]);
  data_pack_local[(5)] = 0.000000e+00f;
  data_pack_local[(5)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(5)]);
  data_pack_local[(5)] = (data_pack_local[(5)] + d[(10)]);
  data_pack_local[(6)] = 0.000000e+00f;
  data_pack_local[(6)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(6)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(9)]);
  data_pack_local[(6)] = (data_pack_local[(6)] + d[(10)]);
  data_pack_local[(7)] = 0.000000e+00f;
  data_pack_local[(7)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(7)]);
  data_pack_local[(7)] = (data_pack_local[(7)] + d[(11)]);
  data_pack_local[(8)] = 0.000000e+00f;
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(4)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(8)] = (data_pack_local[(8)] + d[(8)]);
  data_pack_local[(8)] = __ocml_fma_f32(d[(10)], -1.000000e+00f, data_pack_local[(8)]);
  data_pack_local[(9)] = 0.000000e+00f;
  data_pack_local[(9)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(6)]);
  data_pack_local[(9)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(9)]);
  data_pack_local[(9)] = (data_pack_local[(9)] + d[(10)]);
  data_pack_local[(10)] = 0.000000e+00f;
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(5)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(6)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(9)]);
  data_pack_local[(10)] = (data_pack_local[(10)] + d[(10)]);
  data_pack_local[(11)] = 0.000000e+00f;
  data_pack_local[(11)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(7)]);
  data_pack_local[(11)] = __ocml_fma_f32(d[(9)], -1.000000e+00f, data_pack_local[(11)]);
  data_pack_local[(11)] = (data_pack_local[(11)] + d[(11)]);
  data_pack_local[(12)] = 0.000000e+00f;
  data_pack_local[(12)] = __ocml_fma_f32(d[(4)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32((d[(6)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(12)] = (data_pack_local[(12)] + d[(12)]);
  data_pack_local[(12)] = __ocml_fma_f32(d[(14)], -1.000000e+00f, data_pack_local[(12)]);
  data_pack_local[(13)] = 0.000000e+00f;
  data_pack_local[(13)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(13)]);
  data_pack_local[(13)] = (data_pack_local[(13)] + d[(14)]);
  data_pack_local[(14)] = 0.000000e+00f;
  data_pack_local[(14)] = __ocml_fma_f32(d[(5)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = __ocml_fma_f32(d[(6)], -1.000000e+00f, data_pack_local[(14)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(13)]);
  data_pack_local[(14)] = (data_pack_local[(14)] + d[(14)]);
  data_pack_local[(15)] = 0.000000e+00f;
  data_pack_local[(15)] = __ocml_fma_f32((d[(5)] * -1.000000e+00f), -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(7)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = __ocml_fma_f32(d[(13)], -1.000000e+00f, data_pack_local[(15)]);
  data_pack_local[(15)] = (data_pack_local[(15)] + d[(15)]);
  for (int eps1 = 0; eps1 < 4; ++eps1) {
    for (int nu1 = 0; nu1 < 4; ++nu1) {
      data_pack[(((((eps1 * 100352) + (nu1 * 25088)) + (((int)blockIdx.x) * 128)) + ((int)threadIdx.x)))] = data_pack_local[(((eps1 * 4) + nu1))];
    }
  }
}

extern "C" __global__ void fused_add_10_kernel0(float* __restrict__ T_add, float* __restrict__ placeholder, float* __restrict__ placeholder1) {
    if((int)threadIdx.x + (int)threadIdx.y + (int)threadIdx.z + (int)blockIdx.x + (int)blockIdx.y + (int)blockIdx.z < 0) return;
  for (int ax0_ax1_fused_ax2_fused_ax3_fused_outer = 0; ax0_ax1_fused_ax2_fused_ax3_fused_outer < 3; ++ax0_ax1_fused_ax2_fused_ax3_fused_outer) {
    if ((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) < 150528) {
      T_add[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] = (placeholder[((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)))] + placeholder1[(((((ax0_ax1_fused_ax2_fused_ax3_fused_outer * 65536) + (((int)blockIdx.x) * 256)) + ((int)threadIdx.x)) / 50176))]);
    }
  }
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
