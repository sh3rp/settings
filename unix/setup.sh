#!/bin/sh

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
call plug#begin('/home/shep/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
set autowrite
set t_Co=256
set softtabstop=4
set shiftwidth=4
set background=dark
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
colorscheme PaperColor
EOF

rm -rf $HOME/.vim_temp

# setup go

mkdir -p $HOME/go/src
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/bin

go get -u github.com/sh3rp/s3
go get -u github.com/sh3rp/ears

git config --global user.email "s@kndl.org"
git config --global user.name "Shepherd Kendall"

touch $HOME/.credentials
