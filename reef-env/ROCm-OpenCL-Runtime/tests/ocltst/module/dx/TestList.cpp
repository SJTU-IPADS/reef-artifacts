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

#include "OCLTestListImp.h"

//
// Includes for tests
//
#ifdef ATI_OS_WIN
#include "OCLDX11YUY2.h"
#endif

//
//  Helper macro for adding tests
//
template <typename T>
static void* dictionary_CreateTestFunc(void) {
  return new T();
}

#define TEST(name) \
  { #name, &dictionary_CreateTestFunc < name> }

#ifdef ATI_OS_WIN

TestEntry TestList[] = {TEST(OCLDX11YUY2)};

unsigned int TestListCount = sizeof(TestList) / sizeof(TestList[0]);
#else
TestEntry TestList[] = {{"void", 0}};
unsigned int TestListCount = 0;

#endif
unsigned int TestLibVersion = 0;
const char* TestLibName = "ocldx";
