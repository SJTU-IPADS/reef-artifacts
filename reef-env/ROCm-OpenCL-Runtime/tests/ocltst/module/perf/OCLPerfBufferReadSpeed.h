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

#ifndef _OCL_BufferReadSpeed_H_
#define _OCL_BufferReadSpeed_H_

#include "OCLTestImp.h"

class OCLPerfBufferReadSpeed : public OCLTestImp {
 public:
  OCLPerfBufferReadSpeed();
  virtual ~OCLPerfBufferReadSpeed();

 public:
  virtual void open(unsigned int test, char* units, double& conversion,
                    unsigned int deviceID);
  virtual void run(void);
  virtual unsigned int close(void);

  static const unsigned int NUM_ITER = 1000;

  cl_context context_;
  cl_command_queue cmd_queue_;
  cl_mem outBuffer_;
  cl_int error_;

  unsigned int bufSize_;
  bool persistent;
  bool allocHostPtr;
  bool useHostPtr;
  unsigned int numIter;
  char* hostMem;
  char* alignedMem;
  size_t alignment;
  unsigned int offset;
  bool isAMD;
  char platformVersion[32];
};

class OCLPerfBufferReadRectSpeed : public OCLPerfBufferReadSpeed {
 public:
  OCLPerfBufferReadRectSpeed() : OCLPerfBufferReadSpeed() {}

 public:
  virtual void run(void);
};

#endif  // _OCL_BufferReadSpeed_H_
