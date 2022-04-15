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

#pragma once

#include "platform/context.hpp"
#include "platform/memory.hpp"

namespace amd
{
  class VkObject : public InteropObject
  {
  protected:
    amd::Os::FileDesc handleVk_;

  public:
    //! GLObject constructor initializes member variables
    VkObject(
      amd::Os::FileDesc handle
    ) // Initialization of member variables

    {
      handleVk_ = handle;
    }

    virtual ~VkObject() {}
    VkObject* asVkObject() { return this; }
    amd::Os::FileDesc getVkSharedHandle() const { return handleVk_; }


  };

  class BufferVk : public Buffer, public VkObject
  {
  protected:
    //! Initializes the device memory array which is nested
    // after'BufferVk' object in memory layout.
    void initDeviceMemory() {
      deviceMemories_ =
        reinterpret_cast<DeviceMemory*>(reinterpret_cast<char*>(this) + sizeof(BufferVk));
      memset(deviceMemories_, 0, context_().devices().size() * sizeof(DeviceMemory));
    }
  public:
    //! BufferVk constructor just calls constructors of base classes
    //! to pass down the parameters
    BufferVk(
      Context&          amdContext,
      size_t            uiSizeInBytes,
      amd::Os::FileDesc handle)
      : // Call base classes constructors
      Buffer(
        amdContext,
        0,
        uiSizeInBytes
      ),
      VkObject(
        handle
      )
    {
      setInteropObj(this);
    }
    virtual ~BufferVk() {}

    BufferVk* asBufferVk() { return this; }
  };

  // to be modified once image requirments are known, for now, implement like buffer

  class ImageVk : public Buffer, public VkObject
  {
  protected:
    //! Initializes the device memory array which is nested
    // after'ImageVk' object in memory layout.
    void initDeviceMemory() {
      deviceMemories_ =
        reinterpret_cast<DeviceMemory*>(reinterpret_cast<char*>(this) + sizeof(ImageVk));
      memset(deviceMemories_, 0, context_().devices().size() * sizeof(DeviceMemory));
    }
  public:
    //! ImageVk constructor just calls constructors of base classes
    //! to pass down the parameters
    ImageVk(
      Context&          amdContext,
      size_t            uiSizeInBytes,
      amd::Os::FileDesc handle)
      : // Call base classes constructors
      Buffer(
        amdContext,
        0,
        uiSizeInBytes
      ),
      VkObject(
        handle
      )
    {
      setInteropObj(this);
    }
    virtual ~ImageVk() {}

    ImageVk* asImageVk() { return this; }
  };
}
