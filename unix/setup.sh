#!/bin/sh

GO_VERSION=1.9

# setup vi

rm -rf $HOME/.vim
rm $HOME/.vimrc

mkdir $HOME/.vim
mkdir $HOME/.vim/plugged
mkdir $HOME/.vim_temp

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/Zabanaa/neuromancer.vim $HOME/.vim_temp
cp -R $HOME/.vim_temp/colors $HOME/.vim

cat <<EOF >> $HOME/.vimrc
call plug#begin('$HOME/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
set autowrite
set t_Co=256
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set background=dark
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
colorscheme PaperColor
EOF

rm -rf $HOME/.vim_temp

# setup go

sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:gophers/archive
sudo apt -y update
sudo apt install -y golang-${GO_VERSION} tmux
sudo apt upgrade -y vim

sudo ln -s /usr/lib/go-${GO_VERSION} /usr/local/go

mkdir -p $HOME/go/src
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/bin

go get -u github.com/sh3rp/s3
go get -u github.com/sh3rp/ears

git config --global user.email "s@kndl.org"
git config --global user.name "Shepherd Kendall"

touch $HOME/.credentials
