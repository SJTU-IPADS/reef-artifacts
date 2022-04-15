# REEF-env

This repository contains the modified version of ROCm for REEF. All of the contents are based on the ROCm-4.3.


## Contents
```
> tree .
├── amdgpu-dkms            # The kernel driver of AMD GPU
├── hip                    # The HIP library 
├── rocclr                 # The ROCm language runtime
├── ROCm-OpenCL-Runtime    # The build dependency of rocclr (unmodifed)               
```

## Installation

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
$ cd amdgpu-dkms
$ ./update-kern-module.sh
```

### Build & Install rocclr
```sh
$ export REEF_ENV_ROOT=`pwd`
$ cd rocclr
$ mkdir build
$ cd build
$ cmake -DOPENCL_DIR="${REEF_ENV_ROOT}/ROCm-OpenCL-Runtime" -DCMAKE_INSTALL_PREFIX=/opt/rocm/rocclr ..
$ sudo make install
```

### Build & Install hip
```sh
$ cd hip
$ mkdir build
$ cd build
$ cmake -DCMAKE_PREFIX_PATH="${REEF_ENV_ROOT}/rocclr/build;/opt/rocm/hip" ..
$ sudo make install
```