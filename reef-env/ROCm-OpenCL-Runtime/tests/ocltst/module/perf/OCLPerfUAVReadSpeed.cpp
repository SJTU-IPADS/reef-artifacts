/* Copyright (c) 2010-present Advanced Micro Devices, Inc.

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE. */

#include "OCLPerfUAVReadSpeed.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>

#include "CL/cl.h"
#include "Timer.h"

static const unsigned int NUM_SIZES = 4;
static const unsigned int NUM_READ_MODES = 6;
// Limit to 32 reads for now
static const unsigned int MAX_READ_MODES = 4;

static const unsigned int NumReads[NUM_READ_MODES] = {1, 4, 16, 32, 64, 128};
// 256KB, 1 MB, 4MB, 16 MB
static const unsigned int Sizes[NUM_SIZES] = {262144, 1048576, 4194304,
                                              16777216};
static const unsigned int MaxTypes = 6;
static unsigned int NumTypes = MaxTypes;
static const char *types[MaxTypes] = {"char", "short", "int",
                                      "long", "float", "double"};
static unsigned int StartType = 0;
static const unsigned int NumVecWidths = 5;
static const char *vecWidths[NumVecWidths] = {"", "2", "4", "8", "16"};
static const unsigned int TypeSize[MaxTypes] = {
    sizeof(cl_char), sizeof(cl_short), sizeof(cl_int),
    sizeof(cl_long), sizeof(cl_float), sizeof(cl_double)};
#define CHAR_BUF_SIZE 512

// Quiet pesky warnings
#ifdef WIN_OS
#define SNPRINTF sprintf_s
#else
#define SNPRINTF snprintf
#endif
void OCLPerfUAVReadSpeed::genShader(unsigned int type, unsigned int vecWidth,
                                    unsigned int numReads) {
  char buf[CHAR_BUF_SIZE];

  shader_.clear();
  shader_ +=
      "#ifdef USE_ARENA\n"
      "#pragma OPENCL EXTENSION cl_khr_byte_addressable_store : enable\n"
      "#endif\n";
  shader_ +=
      "#ifdef USE_AMD_DOUBLES\n"
      "#pragma OPENCL EXTENSION cl_amd_fp64 : enable\n"
      "#endif\n";
  shader_ +=
      "#ifdef USE_KHR_DOUBLES\n"
      "#pragma OPENCL EXTENSION cl_khr_fp64 : enable\n"
      "#endif\n";
  SNPRINTF(buf, CHAR_BUF_SIZE,
           "__kernel void __attribute__((reqd_work_group_size(64,1,1))) "
           "_uavReadSpeed(__global %s%s * restrict inBuf, __global %s%s * "
           "restrict outBuf, constant uint * restrict constBuf)\n",
           types[type], vecWidths[vecWidth], types[type], vecWidths[vecWidth]);
  shader_.append(buf);
  shader_ +=
      "{\n"
      "    uint i = (uint) get_global_id(0);\n";
  if (numReads == 1) {
    SNPRINTF(buf, CHAR_BUF_SIZE, "    %s%s temp = 0;\n", types[type],
             vecWidths[vecWidth]);
    shader_.append(buf);
    shader_ +=
        "    const unsigned int Max = constBuf[0];\n"
        "    temp = *(inBuf + i % Max);\n";
    shader_ +=
        "    *(outBuf + i) = temp;\n"
        "}\n";
  } else {
    SNPRINTF(buf, CHAR_BUF_SIZE, "    %s%s temp0 = 0;\n", types[type],
             vecWidths[vecWidth]);
    shader_.append(buf);
    SNPRINTF(buf, CHAR_BUF_SIZE, "    %s%s temp1 = 0;\n", types[type],
             vecWidths[vecWidth]);
    shader_.append(buf);
    SNPRINTF(buf, CHAR_BUF_SIZE, "    %s%s temp2 = 0;\n", types[type],
             vecWidths[vecWidth]);
    shader_.append(buf);
    SNPRINTF(buf, CHAR_BUF_SIZE, "    %s%s temp3 = 0;\n", types[type],
             vecWidths[vecWidth]);
    shader_.append(buf);
    shader_ +=
        "    const unsigned int Max = constBuf[0];\n"
        "    unsigned int idx0 = (i % Max) + constBuf[1];\n"
        "    unsigned int idx1 = (i % Max) + constBuf[2];\n"
        "    unsigned int idx2 = (i % Max) + constBuf[3];\n"
        "    unsigned int idx3 = (i % Max) + constBuf[4];\n";

    for (unsigned int i = 0; i < (numReads >> 2); i++) {
      shader_ += "    temp0 += *(inBuf + idx0);\n";
      shader_ += "    temp1 += *(inBuf + idx1);\n";
      shader_ += "    temp2 += *(inBuf + idx2);\n";
      shader_ += "    temp3 += *(inBuf + idx3);\n";
      shader_ += "    idx0 += constBuf[5];\n";
      shader_ += "    idx1 += constBuf[5];\n";
      shader_ += "    idx2 += constBuf[5];\n";
      shader_ += "    idx3 += constBuf[5];\n";
    }
    shader_ +=
        "    *(outBuf + i) = temp0 + temp1 + temp2 + temp3;\n"
        "}\n";
  }
  // printf("shader:\n%s\n", shader_.c_str());
}

static void CL_CALLBACK notify_callback(const char *errinfo,
                                        const void *private_info, size_t cb,
                                        void *user_data) {}

OCLPerfUAVReadSpeed::OCLPerfUAVReadSpeed() {
  cl_uint numPlatforms;
  cl_platform_id platform = NULL;
  cl_uint num_devices = 0;
  cl_device_id *devices = NULL;
  cl_device_id device = NULL;
  context_ = 0;

  error_ = _wrapper->clGetPlatformIDs(0, NULL, &numPlatforms);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetPlatformIDs failed");
  if (0 < numPlatforms) {
    cl_platform_id *platforms = new cl_platform_id[numPlatforms];
    error_ = _wrapper->clGetPlatformIDs(numPlatforms, platforms, NULL);
    CHECK_RESULT(error_ != CL_SUCCESS, "clGetPlatformIDs failed");
    // Get last for default
    platform = platforms[numPlatforms - 1];
    for (unsigned i = 0; i < numPlatforms; ++i) {
      char pbuf[100];
      error_ = _wrapper->clGetPlatformInfo(platforms[i], CL_PLATFORM_VENDOR,
                                           sizeof(pbuf), pbuf, NULL);
      num_devices = 0;
      /* Get the number of requested devices */
      error_ =
          _wrapper->clGetDeviceIDs(platforms[i], type_, 0, NULL, &num_devices);
      // Runtime returns an error when no GPU devices are present instead of
      // just returning 0 devices
      // CHECK_RESULT(error_ != CL_SUCCESS, "clGetDeviceIDs failed");
      // Choose platform with GPU devices
      if (num_devices > 0) {
        platform = platforms[i];
        break;
      }
    }
    delete platforms;
  }

  /*
   * If we could find our platform, use it. If not, die as we need the AMD
   * platform for these extensions.
   */
  CHECK_RESULT(platform == 0, "Couldn't find AMD platform, cannot proceed");

  devices = (cl_device_id *)malloc(num_devices * sizeof(cl_device_id));
  CHECK_RESULT(devices == 0, "no devices");

  /* Get the requested device */
  error_ =
      _wrapper->clGetDeviceIDs(platform, type_, num_devices, devices, NULL);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetDeviceIDs failed");

  CHECK_RESULT(_deviceId >= num_devices, "Requested deviceID not available");
  device = devices[_deviceId];

  context_ = _wrapper->clCreateContext(NULL, 1, &device, notify_callback, NULL,
                                       &error_);
  CHECK_RESULT(context_ == 0, "clCreateContext failed");

  char charbuf[1024];
  size_t retsize;
  error_ = _wrapper->clGetDeviceInfo(device, CL_DEVICE_EXTENSIONS, 1024,
                                     charbuf, &retsize);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetDeviceInfo failed");

  char *p = strstr(charbuf, "cl_khr_byte_addressable_store");
  char *p2 = strstr(charbuf, "cl_khr_fp64");
  char *p3 = strstr(charbuf, "cl_amd_fp64");

  NumTypes = MaxTypes;
  if (!p) {
    // No arena ops
    NumTypes -= 2;
    StartType = 2;
  }
  if (!p2 && !p3) {
    // Doubles not supported
    NumTypes--;
  }
  _numSubTests = NumTypes * NumVecWidths * NUM_SIZES * MAX_READ_MODES * 2;
  if (context_) {
    error_ = _wrapper->clReleaseContext(context_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS, "clReleaseContext failed");
  }
}

OCLPerfUAVReadSpeed::~OCLPerfUAVReadSpeed() {}

// Fill with 1s of appropriate type
void OCLPerfUAVReadSpeed::setData(cl_mem buffer, float val) {
  void *ptr =
      _wrapper->clEnqueueMapBuffer(cmd_queue_, buffer, true, CL_MAP_WRITE, 0,
                                   bufSize_, 0, NULL, NULL, &error_);
  switch (typeIdx_) {
    case 0:  // char
    {
      char *data = (char *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(char)); i++)
        data[i] = (char)val;
      break;
    }
    case 1:  // short
    {
      short *data = (short *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(short)); i++)
        data[i] = (short)val;
      break;
    }
    case 2:  // int
    {
      int *data = (int *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(int)); i++)
        data[i] = (int)val;
      break;
    }
    case 3:  // long
    {
      cl_long *data = (cl_long *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(cl_long)); i++)
        data[i] = (cl_long)val;
      break;
    }
    case 4:  // float
    {
      float *data = (float *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(float)); i++)
        data[i] = val;
      break;
    }
    case 5:  // double
    {
      double *data = (double *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(double)); i++)
        data[i] = (double)val;
      break;
    }
    default:
      // oops
      break;
  }
  error_ =
      _wrapper->clEnqueueUnmapMemObject(cmd_queue_, buffer, ptr, 0, NULL, NULL);
}

void OCLPerfUAVReadSpeed::checkData(cl_mem buffer) {
  void *ptr =
      _wrapper->clEnqueueMapBuffer(cmd_queue_, buffer, true, CL_MAP_READ, 0,
                                   bufSize_, 0, NULL, NULL, &error_);
  switch (typeIdx_) {
    case 0:  // char
    {
      char *data = (char *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(char)); i++) {
        if (data[i] != (char)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    case 1:  // short
    {
      short *data = (short *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(short)); i++) {
        if (data[i] != (short)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    case 2:  // int
    {
      int *data = (int *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(int)); i++) {
        if (data[i] != (int)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    case 3:  // long
    {
      cl_long *data = (cl_long *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(cl_long)); i++) {
        if (data[i] != (cl_long)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    case 4:  // float
    {
      float *data = (float *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(float)); i++) {
        if (data[i] != (float)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    case 5:  // double
    {
      double *data = (double *)ptr;
      for (unsigned int i = 0; i < (bufSize_ / sizeof(double)); i++) {
        if (data[i] != (double)numReads_) {
          printf("Data validation failed at index %d!\n", i);
          printf("Expected %d %d %d %d\nGot %d %d %d %d\n", numReads_,
                 numReads_, numReads_, numReads_, (unsigned int)data[i],
                 (unsigned int)data[i + 1], (unsigned int)data[i + 2],
                 (unsigned int)data[i + 3]);
          CHECK_RESULT_NO_RETURN(0, "Data validation failed!\n");
          break;
        }
      }
      break;
    }
    default:
      // oops
      break;
  }
  error_ =
      _wrapper->clEnqueueUnmapMemObject(cmd_queue_, buffer, ptr, 0, NULL, NULL);
}

void OCLPerfUAVReadSpeed::open(unsigned int test, char *units,
                               double &conversion, unsigned int deviceId) {
  cl_uint numPlatforms;
  cl_platform_id platform = NULL;
  cl_uint num_devices = 0;
  cl_device_id *devices = NULL;
  cl_device_id device = NULL;
  _crcword = 0;
  conversion = 1.0f;
  _deviceId = deviceId;

  context_ = 0;
  cmd_queue_ = 0;
  program_ = 0;
  kernel_ = 0;
  inBuffer_ = 0;
  outBuffer_ = 0;
  constBuffer_ = 0;
  isAMD = false;
  _errorFlag = false;  // Reset error code so a single error doesn't prevent
                       // other subtests from running
  _errorMsg = "";

  error_ = _wrapper->clGetPlatformIDs(0, NULL, &numPlatforms);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetPlatformIDs failed");
  if (0 < numPlatforms) {
    cl_platform_id *platforms = new cl_platform_id[numPlatforms];
    error_ = _wrapper->clGetPlatformIDs(numPlatforms, platforms, NULL);
    CHECK_RESULT(error_ != CL_SUCCESS, "clGetPlatformIDs failed");
#if 0
        // Get last for default
        platform = platforms[numPlatforms-1];
        for (unsigned i = 0; i < numPlatforms; ++i) {
#endif
    platform = platforms[_platformIndex];
    char pbuf[100];
    error_ = _wrapper->clGetPlatformInfo(platforms[_platformIndex],
                                         CL_PLATFORM_VENDOR, sizeof(pbuf), pbuf,
                                         NULL);
    num_devices = 0;
    /* Get the number of requested devices */
    error_ = _wrapper->clGetDeviceIDs(platforms[_platformIndex], type_, 0, NULL,
                                      &num_devices);
    // Runtime returns an error when no GPU devices are present instead of just
    // returning 0 devices
    // CHECK_RESULT(error_ != CL_SUCCESS, "clGetDeviceIDs failed");
    // Choose platform with GPU devices
    if (num_devices > 0) {
      if (!strcmp(pbuf, "Advanced Micro Devices, Inc.")) {
        isAMD = true;
      }
      // platform = platforms[_platformIndex];
      // break;
    }
#if 0
        }
#endif
    delete platforms;
  }

  numReads_ = NumReads[test % MAX_READ_MODES];
  width_ = Sizes[(test / MAX_READ_MODES) % NUM_SIZES];
  vecSizeIdx_ = (test / (MAX_READ_MODES * NUM_SIZES)) % NumVecWidths;
  typeIdx_ = (test / (MAX_READ_MODES * NUM_SIZES * NumVecWidths)) % NumTypes +
             StartType;
  cached_ = (test >= (MAX_READ_MODES * NUM_SIZES * NumTypes * NumVecWidths));

  bufSize_ = width_;

  /*
   * If we could find our platform, use it. If not, die as we need the AMD
   * platform for these extensions.
   */
  CHECK_RESULT(platform == 0, "Couldn't find AMD platform, cannot proceed");

  devices = (cl_device_id *)malloc(num_devices * sizeof(cl_device_id));
  CHECK_RESULT(devices == 0, "no devices");

  /* Get the requested device */
  error_ =
      _wrapper->clGetDeviceIDs(platform, type_, num_devices, devices, NULL);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetDeviceIDs failed");

  device = devices[0];

  context_ = _wrapper->clCreateContext(NULL, 1, &device, notify_callback, NULL,
                                       &error_);
  CHECK_RESULT(context_ == 0, "clCreateContext failed");

  cmd_queue_ = _wrapper->clCreateCommandQueue(context_, device, 0, NULL);
  CHECK_RESULT(cmd_queue_ == 0, "clCreateCommandQueue failed");

  inBuffer_ = _wrapper->clCreateBuffer(context_, 0, bufSize_, NULL, &error_);
  CHECK_RESULT(inBuffer_ == 0, "clCreateBuffer(inBuffer) failed");

  outBuffer_ = _wrapper->clCreateBuffer(context_, 0, bufSize_, NULL, &error_);
  CHECK_RESULT(outBuffer_ == 0, "clCreateBuffer(outBuffer) failed");

  constBuffer_ = _wrapper->clCreateBuffer(context_, 0, 16 * 2, NULL, &error_);
  CHECK_RESULT(constBuffer_ == 0, "clCreateBuffer(constBuffer) failed");

  genShader(typeIdx_, vecSizeIdx_, numReads_);
  char *tmp = (char *)shader_.c_str();
  program_ = _wrapper->clCreateProgramWithSource(
      context_, 1, (const char **)&tmp, NULL, &error_);
  CHECK_RESULT(program_ == 0, "clCreateProgramWithSource failed");

  std::string args;
  args.clear();
  if (cached_ && isAMD) {
    args = "-fno-alias ";
  }
  if (typeIdx_ < 2) {
    args += "-D USE_ARENA ";
  }

  if (typeIdx_ == 5) {
    if (isAMD) {
      args += "-D USE_AMD_DOUBLES ";
    } else {
      args += "-D USE_KHR_DOUBLES ";
    }
  }
#if 0
    // This setting can dramatically boost the long16 perf results by avoiding spilling.
    if (isAMD)
        args += "-Wb,-pre-RA-sched=list-tdrr";
#endif

  error_ =
      _wrapper->clBuildProgram(program_, 1, &device, args.c_str(), NULL, NULL);
  if (error_ != CL_SUCCESS) {
    cl_int intError;
    char log[16384];
    intError =
        _wrapper->clGetProgramBuildInfo(program_, device, CL_PROGRAM_BUILD_LOG,
                                        16384 * sizeof(char), log, NULL);
    printf("Build error -> %s\n", log);

    CHECK_RESULT(0, "clBuildProgram failed");
  }
  kernel_ = _wrapper->clCreateKernel(program_, "_uavReadSpeed", &error_);
  CHECK_RESULT(kernel_ == 0, "clCreateKernel failed");

  error_ =
      _wrapper->clSetKernelArg(kernel_, 0, sizeof(cl_mem), (void *)&inBuffer_);
  error_ =
      _wrapper->clSetKernelArg(kernel_, 1, sizeof(cl_mem), (void *)&outBuffer_);
  error_ = _wrapper->clSetKernelArg(kernel_, 2, sizeof(cl_mem),
                                    (void *)&constBuffer_);

  setData(inBuffer_, 1.0f);
  setData(outBuffer_, 1.2345678f);
  unsigned int *cBuf = (unsigned int *)_wrapper->clEnqueueMapBuffer(
      cmd_queue_, constBuffer_, true, CL_MAP_WRITE, 0, 16 * 2, 0, NULL, NULL,
      &error_);
  // Force all wavefronts to fetch the same data.  We are looking for peak speed
  // here.
  cBuf[0] = 64;
  // These values are chosen to assure there is no data reuse within a clause.
  // If caching is not working, then the uncached numbers will be low.
  cBuf[1] = 0;
  cBuf[2] = 64;
  cBuf[3] = 128;
  cBuf[4] = 192;
  cBuf[5] = 0;
  error_ = _wrapper->clEnqueueUnmapMemObject(cmd_queue_, constBuffer_, cBuf, 0,
                                             NULL, NULL);
  _wrapper->clFinish(cmd_queue_);
}

void OCLPerfUAVReadSpeed::run(void) {
  int global = bufSize_ / (TypeSize[typeIdx_] * (1 << vecSizeIdx_));
  int local = 64;

  size_t global_work_size[1] = {(size_t)global};
  size_t local_work_size[1] = {(size_t)local};

  CPerfCounter timer;

  timer.Reset();
  timer.Start();
  for (unsigned int i = 0; i < NUM_ITER; i++) {
    error_ = _wrapper->clEnqueueNDRangeKernel(
        cmd_queue_, kernel_, 1, NULL, (const size_t *)global_work_size,
        (const size_t *)local_work_size, 0, NULL, NULL);

    CHECK_RESULT(error_, "clEnqueueNDRangeKernel failed");
  }
  _wrapper->clFinish(cmd_queue_);

  timer.Stop();
  double sec = timer.GetElapsedTime();

  // Constant bandwidth in GB/s
  double perf =
      ((double)bufSize_ * numReads_ * NUM_ITER * (double)(1e-09)) / sec;

  _perfInfo = (float)perf;
  char buf[256];
  char buf2[256];
  SNPRINTF(buf, sizeof(buf), "%s%s", types[typeIdx_], vecWidths[vecSizeIdx_]);
  SNPRINTF(buf2, sizeof(buf2), " %-8s (%8d) %2d reads: %-8s (GB/s) ", buf,
           width_, numReads_, (cached_ ? "cached" : "uncached"));
  testDescString = buf2;
  checkData(outBuffer_);
}

unsigned int OCLPerfUAVReadSpeed::close(void) {
  _wrapper->clFinish(cmd_queue_);

  if (inBuffer_) {
    error_ = _wrapper->clReleaseMemObject(inBuffer_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS,
                           "clReleaseMemObject(inBuffer_) failed");
  }
  if (outBuffer_) {
    error_ = _wrapper->clReleaseMemObject(outBuffer_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS,
                           "clReleaseMemObject(outBuffer_) failed");
  }
  if (constBuffer_) {
    error_ = _wrapper->clReleaseMemObject(constBuffer_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS,
                           "clReleaseMemObject(constBuffer_) failed");
  }
  if (kernel_) {
    error_ = _wrapper->clReleaseKernel(kernel_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS, "clReleaseKernel failed");
  }
  if (program_) {
    error_ = _wrapper->clReleaseProgram(program_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS, "clReleaseProgram failed");
  }
  if (cmd_queue_) {
    error_ = _wrapper->clReleaseCommandQueue(cmd_queue_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS,
                           "clReleaseCommandQueue failed");
  }
  if (context_) {
    error_ = _wrapper->clReleaseContext(context_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS, "clReleaseContext failed");
  }

  return _crcword;
}
