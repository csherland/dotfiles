#!/bin/bash

# Christian Sherland
# 7-13-14
# install-linux.sh
#
#   Install my dotfiles for linux machines
#

# Dependencies and useful packages
sudo apt-get install git
sudo apt-get install build-essential
sudo apt-get install python-dev
sudo apt-get install cmake
sudo apt-get install g++
sudo apt-get install nodejs
sudo apt-get install npm
sudo apt-get install zsh

# Setup vimrc and install plugins
mkdir ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.vim/vimrc ~/.vimrc

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh
cd ~

# ZSH and Oh-My-Zsh + zsh configuration
curl -L http://install.ohmyz.sh | sh
ln -s ~/.dotfiles/zshrc ~/.zshrc

# Fonts

# Git configuration
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
git config --global user.email christiansherland@gmail.com
git config --global user.name 'Christian'
git config --global core.excludesfile '~/.gitignore_global'



