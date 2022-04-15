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

#ifndef _OCLMODULE_H_
#define _OCLMODULE_H_

#ifdef ATI_OS_WIN
#define OCLLCONV __cdecl
#endif
#ifdef ATI_OS_LINUX
#define OCLLCONV
#endif

class OCLTest;

//
//  exported function pointer typedefs
//
typedef unsigned int(OCLLCONV *TestCountFuncPtr)(void);
typedef const char *(OCLLCONV *TestNameFuncPtr)(unsigned int);
typedef OCLTest *(OCLLCONV *CreateTestFuncPtr)(unsigned int);
typedef void(OCLLCONV *DestroyTestFuncPtr)(OCLTest *);
typedef unsigned int(OCLLCONV *TestVersionFuncPtr)(void);
typedef const char *(OCLLCONV *TestLibNameFuncPtr)(void);

#endif  // _OCLMODULE_H_
