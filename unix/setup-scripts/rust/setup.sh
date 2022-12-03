#!/bin/sh

function install_rust() {
    RUST=$(which cargo)
    if [ -z "$RUST" ]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
    install_bat
    install_fd
    install_hexyl
    install_hurl
}

function install_bat() {
    mkdir tmp
    cd tmp
    git clone https://github.com/sharkdp/bat 
    cd bat 
    cargo build
    sudo cp target/debug/bat /usr/local/bin
    cd ../..
    rm -rf tmp
}

function install_fd() {
    mkdir tmp
    cd tmp
    git clone https://github.com/sharkdp/fd
    cd fd 
    cargo build
    sudo cp target/debug/fd /usr/local/bin
    cd ../..
    rm -rf tmp
}

function install_hexyl() {
    mkdir tmp
    cd tmp
    git clone https://github.com/sharkdp/hexyl 
    cd hexyl
    cargo build
    sudo cp target/debug/hexyl /usr/local/bin
    cd ../..
    rm -rf tmp
}

function install_hurl() {
    mkdir tmp
    cd tmp
    git clone https://github.com/Orange-OpenSource/hurl
    cd hurl 
    cargo build 
    sudo cp target/debug/hurl /usr/local/bin
    cd ../..
    rm -rf tmp
}
