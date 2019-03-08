#!/bin/sh
#
# vim/install.sh
#   Installs all my vim plugins
#

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~
