#!/bin/bash

GO_VERSION=1.11
PROTO_VERSION=3.6.1

function install_go() {
    sudo rm -rf /usr/local/go

    wget -O /tmp/go-${GO_VERSION}.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
    cd /usr/local
    sudo tar xvfz /tmp/go-${GO_VERSION}.tar.gz
    rm -rf /tmp/go-${GO_VERSION}

    wget -O /tmp/protoc-${PROTO_VERSION}.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protoc-3.6.1-linux-x86_64.zip
    cd /usr/local
    sudo unzip /tmp/protoc-${PROTO_VERSION}.zip
    rm -rf /tmp/protoc-${PROTO_VERSION}.zip

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
