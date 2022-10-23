#!/bin/bash

set -aux

# ------------- DEFINE BUILD VARIABLES ----------------
echo $BUILD_ARCH | tr 'a-z' 'A-Z' > build_arch_upper_tmp
export "BAUP=$(cat build_arch_upper_tmp)"
export BUILD_NUMBER=$(curl -s http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/Packages | grep ^Filename  | grep pve-kernel-5 | grep amd64.deb$ | sort -V | grep -oP 'kernel-5.15.\d+-\d+' | tail -1 | grep -o .$)
export PACKAGE_NUMBER=$(curl -s http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/Packages | grep ^Filename  | grep pve-kernel-5 | grep amd64.deb$ | sort -V | grep -oP 'pve_5.15.\d+-\d+' | tail -1 | grep -o .$)


echo "PRINT VARIABLES"
echo "BUILD_ARCH: $BUILD_ARCH"
echo "BAUP: $BAUP"
echo "BUILD_NUMBER: $BUILD_NUMBER"
# echo "PACKAGE_NUMBER: $PACKAGE_NUMBER"

# ------------- DEFINE METAPACKAGE VARIABLES ----------------
echo "CPU_ARCH=amd64" >> $GITHUB_ENV
# export "CPU_ARCH=amd64"
echo "KERNEL_VERSION=5.15.64-1" >> $GITHUB_ENV
# export "KERNEL_VERSION=5.15.64-1"
echo "META_VERSION=$(date -u +%y%m%d%H)" >> $GITHUB_ENV
# export "META_VERSION=$(date -u +%y%m%d%H)"

source $GITHUB_ENV
echo "PRINT VARIABLES"
echo "CPU_ARCH $CPU_ARCH"
echo "KERNEL_VERSION $KERNEL_VERSION"
echo "META_VERSION $META_VERSION"
