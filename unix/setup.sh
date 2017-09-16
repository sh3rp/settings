#!/bin/sh

# setup vi
git clone https://github.com/joshdick/onedark.vim $HOME/.vim
echo "syntax on\ncolorscheme onedark\n" > $HOME/.vimrc

# setup omf

curl -L https://get.oh-my.fish | fish
omf install yimmy

# setup go

mkdir -p $HOME/go/src
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/bin

go get -u github.com/sh3rp/s3
go get -u github.com/sh3rp/ears

touch $HOME/.credentials
