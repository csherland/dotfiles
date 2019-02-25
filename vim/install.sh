#!/bin/sh
#
# vim/install.sh
#   Installs all my vim plugins
#

# used to use spf13
# curl https://j.mp/spf13-vim3 -L > ~/spf13-vim.sh && sh ~/spf13-vim.sh
# rm ~/spf13-vim.sh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
