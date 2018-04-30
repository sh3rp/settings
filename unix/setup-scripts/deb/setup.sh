#!/bin/bash

function install_deb() {
    sudo apt -y update && sudo apt -y upgrade
    sudo apt -y install software-properties-common tmux python3-dev python3 python-pip
}
