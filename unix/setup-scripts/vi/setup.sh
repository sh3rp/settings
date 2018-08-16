#!/bin/bash

function install_vi_plugins() {
    # Pathogen
    mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    # Plug
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Airlines
    git clone https://github.com/vim-airline/vim-airline-themes .temp_airlines
    cp -R .temp_airlines/autoload $HOME/.vim
    rm -rf .temp_airlines
    # Nerdtree
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

    ln -s $HOME/settings/unix/.vimrc $HOME/.vimrc
}

function install_vi() {
    sudo apt -y remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
     
    sudo apt -y install liblua5.3-dev python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

    #Optional: so vim can be uninstalled again via `dpkg -r vim`
    sudo apt -y install checkinstall

    sudo rm -rf /usr/local/share/vim /usr/bin/vim

    cd ~
    git clone https://github.com/vim/vim
    cd vim
    git pull && git fetch

    #In case Vim was already installed
    cd src
    make distclean
    cd ..

    ./configure \
	--enable-multibyte \
	--enable-perlinterp=dynamic \
	--enable-rubyinterp=dynamic \
	--with-ruby-command=/usr/local/bin/ruby \
	--enable-pythoninterp=dynamic \
	--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
	--enable-python3interp \
	--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	--enable-luainterp \
	--with-luajit \
	--enable-cscope \
	--enable-gui=auto \
	--with-features=huge \
	--with-x \
	--enable-fontset \
	--enable-largefile \
	--disable-netbeans \
	--with-compiledby="Shepherd Kendall" \
	--enable-fail-if-missing

    make && sudo make install

    sudo ln -s /usr/local/bin/vim /usr/bin/vi

    install_vi_plugins
}
