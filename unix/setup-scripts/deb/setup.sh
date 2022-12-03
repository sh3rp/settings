#!/bin/bash

function install_deb() {
    sudo apt -y update && sudo apt -y upgrade
    sudo apt -y install gcc net-tools software-properties-common tmux python3-dev python3 autoconf make libssl-dev unzip ripgrep
    wget -O $HOME/.tmux.conf https://raw.githubusercontent.com/hamvocke/dotfiles/master/tmux/.tmux.conf
}
