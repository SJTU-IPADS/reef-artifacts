#!/bin/bash

package=${PACKAGE:-amdgpu}
version=${VERSION:-4.3-52}
kernel=${KERNEL_VERSION:-5.9.0-rc2-amdgpu}

sudo dkms remove $package/$version -k $kernel
sudo dkms build -m $package -v $version --sourcetree `pwd`
sudo dkms install -m $package -v $version

sudo reboot