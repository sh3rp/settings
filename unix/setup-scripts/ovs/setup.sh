#!/bin/sh

OVS_VERSION=2.7.0

BUILD_DIR=$(pwd)/build

install_ovs () {
    sudo apt -y update && sudo apt -y upgrade
    sudo apt install -y python python-six autoconf make
    rm -rf ${BUILD_DIR}
    mkdir -p ${BUILD_DIR}
    cd ${BUILD_DIR}
    git clone https://github.com/openvswitch/ovs.git
    cd ovs
    git checkout v${OVS_VERSION}
    ./boot.sh
    ./configure
    make
    sudo make install
    rm -rf ${BUILD_DIR}
}
