#!/bin/bash
export NNCV=11-8
export NNARCH=arm64
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/"${NNARCH}"/cuda-keyring_1.1-1_all.deb
dpkg -i cuda-keyring_1.1-1_all.deb
rm -f cuda-keyring_1.1-1_all.deb
apt-get update
apt-get -y install cuda-nvcc-${NNCV} libcublas-dev-${NNCV}
