#!/bin/bash -x

install_helix() {
    RUST=$(which cargo)
    if [ -z "$RUST" ]; then
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
    mkdir $HOME/tmp
    cd $HOME/tmp
    git clone https://github.com/helix-editor/helix
    cd helix
    cargo install --path helix-term --locked
    sudo cp target/release/hx /usr/local/bin
    cd ../..
    mkdir -p $HOME/.config/helix
    cp -R runtime $HOME/.config/helix
    rm -rf tmp
}
