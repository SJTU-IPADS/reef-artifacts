# Artifact Evaluation for REEF [OSDI'22]

This repository contains scripts and instructions for reproducing the experiments in our OSDI '22 paper "Achieving μs-scale Preemption for Concurrent GPU-accelerated DNN Inferences".

REEF is a GPU-accelerated DNN inference scheduling system that supports instant kernel preemption and biased concurrent execution in GPU scheduling. REEF divides DNN inference tasks into two priorities: real-time tasks and best-effort tasks. The scheduling goal of REEF is to minimize the latency of real-time task and improve the throughput as much as possible.

## Table of Contents

- [Artifact Evaluation for REEF [OSDI'22]](#artifact-evaluation-for-reef-osdi22)
  - [Table of Contents](#table-of-contents)
  - [Project Structure](#project-structure)
  - [Paper's Hardware Configuration](#papers-hardware-configuration)
  - [Installation](#installation)
    - [Software Version](#software-version)
    - [Installation Overview](#installation-overview)
    - [Install ROCm-4.3](#install-rocm-43)
    - [Build & Install the Customized Kernel Driver](#build--install-the-customized-kernel-driver)
    - [Build & Install rocclr](#build--install-rocclr)
    - [Build & Install hip](#build--install-hip)
    - [Install CMake](#install-cmake)
    - [Install glog](#install-glog)
    - [Install gtest](#install-gtest)
    - [Install grpc + protobuf](#install-grpc--protobuf)
  - [Build REEF](#build-reef)
    - [Build Resource](#build-resource)
    - [Build REEF](#build-reef-1)
    - [Run tests](#run-tests)
  - [Experiments](#experiments)
    - [Experiment mode](#experiment-mode)
    - [Run Experiment](#run-experiment)
    - [Experiment Output](#experiment-output)
    - [Expected Running Time](#expected-running-time)

## Project Structure
```
> tree .
├── cmake                     
├── evaluation                    # Scripts for evaluation
│   ├── fig10
│   │   ├── generate.py           # The script to reproduce the experiment data of Fig.10
│   │   ├── fig10a.plt            # Gnuplot script to generate Fig.10
│   ├── fig11
│   ├── fig12
├── resource                      # DNN model resources for the evaluations
│   ├── resnet                    # DNN model for ResNet
│   │   ├── resnet.json           # The schedule graph (meta data) of the DNN model
│   │   ├── resnet.cu             # The raw GPU device code (GPU kernels) for the DNN model
│   │   ├── resnet.trans.cu       # The transformed GPU device code which supports dynamic kernel padding
│   │   ├── resnet.be.cu          # The transformed GPU devide code which supports reset-based preemption
│   │   ├── resnet.profile.json   # The profile of the kernel execution time
│   ├── densenet
│   ├── inception
├── script                        # Utility scripts
└── src                           # source code
│   ├── eval                      # Evaluation source code
│   └── reef                      # REEF source code
│
├── reef-env                      # customized ROCm for REEF
└── env.sh                        # Environment variables
```

## Paper's Hardware Configuration
* Intel Core i7-10700 CPU
* AMD Radeon Instinct MI50 GPU (16GB) (**IMPORTANT: this artifact ONLY supports this GPU**)
* 16GB DRAM

## Installation

> **For AEC reviewers**:
> 
> We recommend using our container deployed in our cluster to minimize the effort on building up the environment.
> Once connected to the container, the Installation section can be skipped.
> We have created an account for each reviewer, you can find it in the Artifact README of our AE submission.
> 

### Software Version
* Ubuntu 18.04
* ROCm 4.3.0
* CMake > 3.18
* grpc 1.45
* glog 0.6.0
* googletest 1.11.0 

### Installation Overview

The installation has six major steps:
1. Install ROCm-4.3
2. Install the customized GPU kernel driver (for reset-based preemption), and reboot
3. (Recommended, but Optional) create the ROCm docker container
4. Install the customized GPU runtime (hip, rocclr)
5. Install other software dependencies (e.g., grpc)
6. Build REEF

### Install ROCm-4.3
```sh
# Ensure the system is up to date.
$ sudo apt update
$ sudo apt dist-upgrade
$ sudo apt install libnuma-dev
$ sudo reboot

# Add the ROCm apt repository.
$ sudo apt install wget gnupg2
$ wget -q -O - https://repo.radeon.com/rocm/rocm.gpg.key | sudo apt-key add -
$ echo 'deb [arch=amd64] https://repo.radeon.com/rocm/apt/4.3/ ubuntu main' | sudo tee /etc/apt/sources.list.d/rocm.list
$ sudo apt update

# Install the ROCm package and reboot.
$ sudo apt install rocm-dkms && sudo reboot

# Add ROCm binaries to PATH.
$ echo 'export PATH=$PATH:/opt/rocm/bin:/opt/rocm/rocprofiler/bin:/opt/rocm/opencl/bin' | sudo tee -a /etc/profile.d/rocm.sh
```


### Build & Install the Customized Kernel Driver
```sh
$ cd reef-env/amdgpu-dkms
# Notice: The script will reboot
$ ./update-kern-module.sh
```

### Build & Install rocclr
```sh
# in reef-env
$ export REEF_ENV_ROOT=`pwd`
$ cd rocclr
$ mkdir build
$ cd build
$ cmake -DOPENCL_DIR="${REEF_ENV_ROOT}/ROCm-OpenCL-Runtime" -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocclr ..
$ sudo make install
```

### Build & Install hip
```sh
# in reef-env
$ export REEF_ENV_ROOT=`pwd`
$ cd hip
$ mkdir build
$ cd build
$ cmake -DCMAKE_PREFIX_PATH="${REEF_ENV_ROOT}/rocclr/build;/opt/rocm/hip" ..
$ sudo make install
```

### Install CMake
```sh
$ wget https://github.com/Kitware/CMake/releases/download/v3.22.4/cmake-3.22.4-linux-x86_64.sh
$ sh cmake-3.22.4-linux-x86_64
# you can also add this cmake version to ~/.bashrc
$ export PATH=~/cmake-3.22.4-linux-x86_64/bin:$PATH 
$ cmake --version
cmake version 3.22.4
```

### Install glog
```sh
$ git clone https://github.com/google/glog
$ cd glog
$ mkdir build; cd build
$ cmake ..
$ sudo make install
```

### Install gtest
```sh
$ git clone -b  https://github.com/google/googletest
$ cd googletest
$ mkdir build; cd build
$ cmake ..
$ sudo make install
```

### Install grpc + protobuf
```sh
$ git clone -b 1.45.0 https://github.com/grpc/grpc
$ cd grpc
$ git submodule update --init
$ mkdir -p cmake/build; cd cmake/build
$ cmake ../..
$ sudo make install
```


## Build REEF

### Build Resource
```sh
$ cd resource
$ make
```

### Build REEF
```sh
$ mkdir build; cd build
$ cmake ..
$ make -j4
```

### Run tests
```sh
# in ./build
$ ./unit_test
```

## Experiments

### Experiment mode

This artifact provides two kinds of mode for the experiments: **quick mode** and **full mode**.

The quick mode run only a few seconds for each test case, which is much faster than
the full model but is enough to generate the data and figure. 

To enable the quick mode:
```sh
export REEF_QUICK_EVAL=1
```
To disable the quick mode:
```sh
unset REEF_QUICK_EVAL
```

### Run Experiment

Set the environment variable.
```sh
# in reef-artifact dir
source env.sh
```

To generate the figures in a fig dir (e.g., fig10):
```sh
cd evaluation
make -C fig10
```

To run all experiments:
```sh
# after source env.sh and in ./evaluation
make
```

To clean the results:
```sh
# after source env.sh and in ./evaluation
make clean
```

### Experiment Output
The output of each experiment is a pdf-format figure, corresponding to the figure in our paper. For example, the outputs in `fig10` are `fig10a.pdf` and `fig10b.pdf`, corresponding to `Fig.10(a)` and `Fig.10(b)` in our paper.

### Expected Running Time

| Experiment |  Expected Run Time (Quick) | Expected Run Time (Full) |
|:----------:| :-----------------:| :-----------------:|
|  Fig.1 (a)(b)(c)(d) | 8min | 20min |
|  Fig.10 (a)(b) | 5min | 25min |
|  Fig.11 (a)(b) | 8min | 25min |
|  Fig.12 (a) | 5min | 10min |
|  Fig.13 (a)(b) | 8min | 20min |
|  Fig.14 (a)(b) | 5min | 10min |
|  Fig.15 (a)(b) | 5min | 20min |
|  Fig.16 (a) | 5min | 20min |
|  Fig.17 (a) | 5min | 25min |
