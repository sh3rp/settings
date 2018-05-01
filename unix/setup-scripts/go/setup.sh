#!/bin/bash

GO_VERSION=1.10

function install_go() {
    sudo rm -rf /usr/local/go

    sudo add-apt-repository ppa:gophers/archive
    sudo apt -y update
    sudo apt install golang-${GO_VERSION}

    sudo ln -s /usr/lib/go-${GO_VERSION} /usr/local/go

    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go

    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    go get -u github.com/golang/dep/cmd/dep

    go get -u github.com/sh3rp/s3
    go get -u github.com/sh3rp/ears
    go get -u github.com/sh3rp/tcping
    go get -u github.com/sh3rp/encdec/cmd/enc
    go get -u github.com/sh3rp/encdec/cmd/dec

    sudo setcap cap_net_raw+ep $GOPATH/bin/tcping
}
