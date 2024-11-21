#!/bin/bash

ZIG_VERSION="0.14.0-dev.2271+f845fa04a"
ZIG_IMAGE="zig-linux-x86_64-${ZIG_VERSION}"

function install_zig() {
   ZIG_BINARY="${ZIG_IMAGE}.tar.xz"
   ZIG_URL="https://ziglang.org/builds/${ZIG_BINARY}" 
   wget -O /tmp/zig.tar.xz ${ZIG_URL}
   cd /tmp
   xz -d zig.tar.xz
   tar xvf zig.tar
   sudo cp /tmp/${ZIG_IMAGE}/zig /usr/local/bin
   rm -rf /tmp/${ZIG_IMAGE}*
}
