#!/bin/bash

GO_VERSION=1.11

function install_go() {
    sudo rm -rf /usr/local/go

    wget -O /tmp/go-${GO_VERSION}.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
    cd /usr/local
    sudo tar xvfz /tmp/go-${GO_VERSION}.tar.gz

    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go

    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

    go get -u github.com/golang/dep/cmd/dep

    go get -u github.com/sh3rp/s3
    go get -u github.com/sh3rp/ears
    go get -u github.com/sh3rp/tcping/cmd/tcping
    go get -u github.com/sh3rp/encdec/cmd/enc
    go get -u github.com/sh3rp/encdec/cmd/dec

    sudo setcap cap_net_raw+ep $GOPATH/bin/tcping
}
