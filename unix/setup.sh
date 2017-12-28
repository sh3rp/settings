#!/bin/sh

GO_VERSION=1.9.2

# setup go

sudo add-apt-repository -y ppa:gophers/archive
sudo apt -y update
sudo apt install -y software-properties-common curl tmux golang-${GO_VERSION} python3-pip python-pip
sudo apt upgrade -y vim

# setup vi

rm -rf $HOME/.vim
rm -rf $HOME/.vim_temp
rm $HOME/.vimrc

mkdir $HOME/.vim
mkdir $HOME/.vim/plugged
mkdir $HOME/.vim_temp

# setup Plug

mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# setup Pathogen

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup Airlines

git clone https://github.com/vim-airline/vim-airline-themes .temp_airlines
cp -R .temp_airlines/autoload $HOME/.vim
rm -rf .temp_airlines

# setup nerdtree

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# setup deoplete

pip3 install neovim

ln -s $HOME/settings/unix/.vimrc $HOME/.vimrc

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

git config --global user.email "s@kndl.org"
git config --global user.name "Shepherd Kendall"

touch $HOME/.credentials
