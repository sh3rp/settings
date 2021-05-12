#!/bin/bash

GO_VERSION=1.15.1
PROTO_VERSION=3.6.1

function install_go() {
    sudo rm -rf /usr/local/go

    OS=$(uname)

    echo "Setting up go for $OS..."

    case $OS in
	"Linux")
	    wget -O /tmp/go-${GO_VERSION}.tar.gz https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz
	    ;;
	"Darwin")
	    wget -O /tmp/go-${GO_VERSION}.tar.gz https://dl.google.com/go/go${GO_VERSION}.darwin-amd64.tar.gz
	    ;;
    esac

    cd /usr/local
    sudo tar xvfz /tmp/go-${GO_VERSION}.tar.gz
    rm -rf /tmp/go-${GO_VERSION}

    case $OS in
	"Linux")
	    wget -O /tmp/protoc-${PROTO_VERSION}.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-linux-x86_64.zip
	    ;;
	"Darwin")
	    wget -O /tmp/protoc-${PROTO_VERSION}.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTO_VERSION}/protoc-${PROTO_VERSION}-osx-x86_64.zip
    esac

    cd /usr/local
    sudo unzip /tmp/protoc-${PROTO_VERSION}.zip
    rm -rf /tmp/protoc-${PROTO_VERSION}.zip

    export GOROOT=/usr/local/go

    export PATH=$PATH:$GOROOT/bin

    go get -u github.com/sh3rp/s3
    go get -u github.com/sh3rp/ears
    go get -u github.com/sh3rp/tcping/cmd/tcping
    go get -u github.com/sh3rp/encdec/cmd/enc
    go get -u github.com/sh3rp/encdec/cmd/dec
    go get -u github.com/sh3rp/stringen
		go get -u github.com/sh3rp/lpc
    go get -u github.com/itchyny/gojq/cmd/gojq

    sudo setcap cap_net_raw+ep $GOPATH/bin/tcping

}
