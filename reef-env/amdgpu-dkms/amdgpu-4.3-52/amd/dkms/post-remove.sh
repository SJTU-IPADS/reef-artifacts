#!/bin/bash

FW_DIR="/lib/firmware/updates"
rm -rf $FW_DIR/amdgpu
[[ ! $(ls -A $FW_DIR) ]] && rm -rf $FW_DIR
