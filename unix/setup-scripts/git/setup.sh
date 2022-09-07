#!/bin/bash

function install_git() {
    git config --global user.name "Shepherd Kendall"
    git config --global user.email "s@kndl.io"
    git config --global core.editor vim
    git config --global credential.helper "cache --timeout=604800"
}
