#!/bin/bash

FW_DIR="/lib/firmware/updates"
mkdir -p $FW_DIR
cp -ar /usr/src/amdgpu-4.3-52/firmware/amdgpu $FW_DIR
