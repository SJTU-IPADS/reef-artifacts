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

#include "OCLPerfPinnedBufferWriteSpeed.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>

#include <complex>

#include "CL/opencl.h"
#include "Timer.h"

// Quiet pesky warnings
#ifdef WIN_OS
#define SNPRINTF sprintf_s
#else
#define SNPRINTF snprintf
#endif

#define NUM_SIZES 8
// 256KB, 1 MB, 4MB, 16 MB
static const unsigned int Sizes[NUM_SIZES] = {
    1024, 4 * 1024, 8 * 1024, 16 * 1024, 262144, 1048576, 4194304, 16777216};

static cl_uint blockedSubtests;

static const unsigned int Iterations[2] = {
    1, OCLPerfPinnedBufferWriteSpeed::NUM_ITER};
#define NUM_OFFSETS 2
static const unsigned int offsets[NUM_OFFSETS] = {0, 16};
#define NUM_SUBTESTS (1 + NUM_OFFSETS)
OCLPerfPinnedBufferWriteSpeed::OCLPerfPinnedBufferWriteSpeed() {
  _numSubTests = NUM_SIZES * NUM_SUBTESTS * 2;
  blockedSubtests = _numSubTests;
  _numSubTests += NUM_SIZES * NUM_SUBTESTS;
}

OCLPerfPinnedBufferWriteSpeed::~OCLPerfPinnedBufferWriteSpeed() {}

static void CL_CALLBACK notify_callback(const char *errinfo,
                                        const void *private_info, size_t cb,
                                        void *user_data) {}

extern const char *blkStr[2];

void OCLPerfPinnedBufferWriteSpeed::open(unsigned int test, char *units,
                                         double &conversion,
                                         unsigned int deviceId) {
  cl_uint numPlatforms;
  cl_platform_id platform = NULL;
  cl_uint num_devices = 0;
  cl_device_id *devices = NULL;
  cl_device_id device = NULL;
  _crcword = 0;
  conversion = 1.0f;
  _deviceId = deviceId;
  _openTest = test;

  context_ = 0;
  cmd_queue_ = 0;
  outBuffer_ = 0;
  persistent = false;
  allocHostPtr = false;
  useHostPtr = false;
  hostMem = NULL;
  alignedMem = NULL;
  alignment = 4096;
  isAMD = false;

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
  /*
   * If we could find our platform, use it. If not, die as we need the AMD
   * platform for these extensions.
   */
  CHECK_RESULT(platform == 0, "Couldn't find AMD platform, cannot proceed");

  char getVersion[128];
  error_ = _wrapper->clGetPlatformInfo(platform, CL_PLATFORM_VERSION,
                                       sizeof(getVersion), getVersion, NULL);
  CHECK_RESULT(error_ != CL_SUCCESS, "clGetPlatformInfo failed");
  platformVersion[0] = getVersion[7];
  platformVersion[1] = getVersion[8];
  platformVersion[2] = getVersion[9];
  platformVersion[3] = '\0';
  bufSize_ = Sizes[_openTest % NUM_SIZES];

  if (((_openTest / NUM_SIZES) % NUM_SUBTESTS) > 0) {
    useHostPtr = true;
    offset = offsets[((_openTest / NUM_SIZES) % NUM_SUBTESTS) - 1];
  } else if (((_openTest / NUM_SIZES) % NUM_SUBTESTS) == 0) {
    allocHostPtr = true;
  }

  if (_openTest < blockedSubtests) {
    numIter = Iterations[_openTest / (NUM_SIZES * NUM_SUBTESTS)];
  } else {
    numIter = 4 * OCLPerfPinnedBufferWriteSpeed::NUM_ITER /
              ((_openTest % NUM_SIZES) + 1);
  }

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

  cmd_queue_ = _wrapper->clCreateCommandQueue(context_, device, 0, NULL);
  CHECK_RESULT(cmd_queue_ == 0, "clCreateCommandQueue failed");

  cl_mem_flags flags = CL_MEM_READ_ONLY;
  if (allocHostPtr) {
    flags |= CL_MEM_ALLOC_HOST_PTR;
  } else if (useHostPtr) {
    flags |= CL_MEM_USE_HOST_PTR;
    hostMem = (char *)malloc(bufSize_ + alignment - 1 + offset);
    CHECK_RESULT(hostMem == 0, "malloc(hostMem) failed");
    alignedMem =
        (char *)((((intptr_t)hostMem + alignment - 1) & ~(alignment - 1)) +
                 offset);
  }
  inBuffer_ =
      _wrapper->clCreateBuffer(context_, flags, bufSize_, alignedMem, &error_);
  CHECK_RESULT(inBuffer_ == 0, "clCreateBuffer(inBuffer) failed");
  outBuffer_ = _wrapper->clCreateBuffer(context_, 0, bufSize_, 0, &error_);
  CHECK_RESULT(outBuffer_ == 0, "clCreateBuffer(outBuffer) failed");

  // Force memory to be on GPU if possible
  {
    cl_mem memBuffer =
        _wrapper->clCreateBuffer(context_, 0, bufSize_, NULL, &error_);
    CHECK_RESULT(memBuffer == 0, "clCreateBuffer(memBuffer) failed");

    _wrapper->clEnqueueCopyBuffer(cmd_queue_, memBuffer, inBuffer_, 0, 0,
                                  bufSize_, 0, NULL, NULL);
    _wrapper->clFinish(cmd_queue_);

    _wrapper->clEnqueueCopyBuffer(cmd_queue_, memBuffer, outBuffer_, 0, 0,
                                  bufSize_, 0, NULL, NULL);
    _wrapper->clFinish(cmd_queue_);

    _wrapper->clReleaseMemObject(memBuffer);
  }
}

void OCLPerfPinnedBufferWriteSpeed::run(void) {
  CPerfCounter timer;
  void *mem =
      _wrapper->clEnqueueMapBuffer(cmd_queue_, inBuffer_, CL_TRUE, CL_MAP_WRITE,
                                   0, bufSize_, 0, NULL, NULL, &error_);
  CHECK_RESULT(error_, "clEnqueueMapBuffer failed");
  cl_bool blocking = (_openTest < blockedSubtests) ? CL_TRUE : CL_FALSE;

  // Warm up
  error_ = _wrapper->clEnqueueWriteBuffer(cmd_queue_, outBuffer_, CL_TRUE, 0,
                                          bufSize_, mem, 0, NULL, NULL);

  CHECK_RESULT(error_, "clEnqueueWriteBuffer failed");

  timer.Reset();
  timer.Start();
  for (unsigned int i = 0; i < numIter; i++) {
    error_ = _wrapper->clEnqueueWriteBuffer(cmd_queue_, outBuffer_, blocking, 0,
                                            bufSize_, mem, 0, NULL, NULL);
    CHECK_RESULT(error_, "clEnqueueWriteBuffer failed");
  }
  if (blocking != CL_TRUE) {
    _wrapper->clFinish(cmd_queue_);
  }
  timer.Stop();
  double sec = timer.GetElapsedTime();

  // Buffer read bandwidth in GB/s
  double perf = ((double)bufSize_ * numIter * (double)(1e-09)) / sec;

  _perfInfo = (float)perf;
  char str[256];
  if (allocHostPtr) {
    SNPRINTF(str, sizeof(str), "ALLOC_HOST_PTR (GB/s)");
  } else if (useHostPtr) {
    SNPRINTF(str, sizeof(str), "off: %4d   USE_HOST_PTR (GB/s)", offset);
  }
  char buf[256];
  SNPRINTF(buf, sizeof(buf), " (%8d bytes) %3s i: %4d %31s ", bufSize_,
           blkStr[blocking], numIter, str);
  testDescString = buf;

  error_ = _wrapper->clEnqueueUnmapMemObject(cmd_queue_, inBuffer_, mem, 0,
                                             NULL, NULL);
  CHECK_RESULT(error_, "clEnqueueUnmapMemObject failed");
}

unsigned int OCLPerfPinnedBufferWriteSpeed::close(void) {
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
  if (cmd_queue_) {
    error_ = _wrapper->clReleaseCommandQueue(cmd_queue_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS,
                           "clReleaseCommandQueue failed");
  }
  if (context_) {
    error_ = _wrapper->clReleaseContext(context_);
    CHECK_RESULT_NO_RETURN(error_ != CL_SUCCESS, "clReleaseContext failed");
  }
  if (hostMem) {
    free(hostMem);
  }

  return _crcword;
}

void OCLPerfPinnedBufferWriteRectSpeed::run(void) {
  CPerfCounter timer;
  void *mem =
      _wrapper->clEnqueueMapBuffer(cmd_queue_, inBuffer_, CL_TRUE, CL_MAP_READ,
                                   0, bufSize_, 0, NULL, NULL, &error_);
  CHECK_RESULT(error_, "clEnqueueMapBuffer failed");
  size_t width = static_cast<size_t>(sqrt(static_cast<float>(bufSize_)));
  size_t bufOrigin[3] = {0, 0, 0};
  size_t hostOrigin[3] = {0, 0, 0};
  size_t region[3] = {width, width, 1};
  // Clamp iteration count to reduce test run time
  unsigned int testNumIter;
  testNumIter = (numIter < 100 ? numIter : 100);
  cl_bool blocking = (_openTest < blockedSubtests) ? CL_TRUE : CL_FALSE;

  // Skip for 1.0 platforms
  if ((platformVersion[0] == '1') && (platformVersion[2] == '0')) {
    testDescString = " SKIPPED ";
    return;
  }
  // Warm up
  error_ = _wrapper->clEnqueueWriteBufferRect(
      cmd_queue_, outBuffer_, CL_TRUE, bufOrigin, hostOrigin, region, width, 0,
      width, 0, mem, 0, NULL, NULL);

  CHECK_RESULT(error_, "clEnqueueReadBufferRect failed");

  timer.Reset();
  timer.Start();
  for (unsigned int i = 0; i < testNumIter; i++) {
    error_ = _wrapper->clEnqueueWriteBufferRect(
        cmd_queue_, outBuffer_, blocking, bufOrigin, hostOrigin, region, width,
        0, width, 0, mem, 0, NULL, NULL);
    CHECK_RESULT(error_, "clEnqueueWriteBufferRect failed");
  }
  if (blocking != CL_TRUE) {
    _wrapper->clFinish(cmd_queue_);
  }
  timer.Stop();
  double sec = timer.GetElapsedTime();

  // Buffer read bandwidth in GB/s
  double perf = ((double)bufSize_ * testNumIter * (double)(1e-09)) / sec;

  _perfInfo = (float)perf;
  char str[256];
  if (allocHostPtr) {
    SNPRINTF(str, sizeof(str), "ALLOC_HOST_PTR (GB/s)");
  } else if (useHostPtr) {
    SNPRINTF(str, sizeof(str), "off: %4d   USE_HOST_PTR (GB/s)", offset);
  }
  char buf[256];
  SNPRINTF(buf, sizeof(buf), " (%8d bytes) %3s i: %4d %31s ", bufSize_,
           blkStr[blocking], testNumIter, str);
  testDescString = buf;

  error_ = _wrapper->clEnqueueUnmapMemObject(cmd_queue_, inBuffer_, mem, 0,
                                             NULL, NULL);
  CHECK_RESULT(error_, "clEnqueueUnmapMemObject failed");
}
