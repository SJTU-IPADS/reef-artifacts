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

#ifndef _OCL_UncoalescedRead_H_
#define _OCL_UncoalescedRead_H_

#include "OCLTestImp.h"
#define NUM_READS 32
class OCLPerfUncoalescedRead : public OCLTestImp {
 public:
  OCLPerfUncoalescedRead();
  virtual ~OCLPerfUncoalescedRead();
  virtual void open(unsigned int test, char* units, double& conversion,
                    unsigned int deviceID);
  virtual void run(void);
  virtual unsigned int close(void);

 private:
  static const unsigned int NUM_ITER = 1000;
  static const unsigned int SIZE = 250000;
  static const char* kernel_str;
  bool silentFailure;
  float* input_buff;
  void validate(void);
};

#endif  // _OCL_UncoalescedRead_H_
