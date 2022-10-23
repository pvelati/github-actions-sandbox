#!/bin/bash

# ------------- DEFINE VARIABLES ----------------
# echo $BUILD_ARCH | tr 'a-z' 'A-Z' > build_arch_upper_tmp
# export BAUP=$(cat build_arch_upper_tmp)
# export BUILD_NUMBER=$(curl -s http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/Packages | grep ^Filename  | grep pve-kernel-5 | grep amd64.deb$ | sort -V | grep -oP 'kernel-5.15.\d+-\d+' | tail -1 | grep -o .$)
# export PACKAGE_NUMBER=$(curl -s http://download.proxmox.com/debian/pve/dists/bullseye/pve-no-subscription/binary-amd64/Packages | grep ^Filename  | grep pve-kernel-5 | grep amd64.deb$ | sort -V | grep -oP 'pve_5.15.\d+-\d+' | tail -1 | grep -o .$)

echo "PRINT VARIABLES"
echo "BUILD_ARCH: $BUILD_ARCH"

export KERNEL_VERSION=$(ls ../pve-kernel/pve-headers-*.deb | grep -oP '5.15.\d+-\d+' | head -n 1)
echo "KERNEL_VERSION=$(echo $KERNEL_VERSION)" >> $GITHUB_ENV
export META_VERSION=$(date -u +%y%m%d%H)
echo "META_VERSION=$(echo $META_VERSION)" >> $GITHUB_ENV
