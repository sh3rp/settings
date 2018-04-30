#!/bin/bash

source $(pwd)/setup/vi

GO_VERSION=1.10

sudo add-apt-repository -y ppa:gophers/archive
sudo apt -y update
sudo apt install -y software-properties-common curl tmux golang-${GO_VERSION} python3-pip python-pip
pip3 install --upgrade --user pip

# setup vi

rm -rf $HOME/.vim
rm -rf $HOME/.vim_temp
rm $HOME/.vimrc

mkdir $HOME/.vim
mkdir $HOME/.vim/plugged
mkdir $HOME/.vim_temp

install_vi
install_vi_plugins

# setup go

if [ -e "/usr/local/go" ]; then
    sudo rm /usr/local/go
fi

sudo ln -s /usr/lib/go-${GO_VERSION} /usr/local/go

export GOPATH=$HOME/go

mkdir -p $HOME/go/src
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/bin

# add go utilities

go get -u github.com/golang/dep/cmd/dep

go get -u github.com/sh3rp/s3
go get -u github.com/sh3rp/ears
go get -u github.com/sh3rp/tcping

sudo setcap cap_net_raw+ep $GOPATH/bin/tcping

# setup identity

git config --global user.email "s@kndl.org"
git config --global user.name "Shepherd Kendall"
git config --global credential.helper cache

touch $HOME/.credentials
