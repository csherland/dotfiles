#!/bin/bash
#
# Christian Sherland
# 6/23/14
#
# install.sh
#   Setup script for my dotfiles on an OSX machine.
#

# Homebrew!
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# Make sure you have everything you need!
brew install git
brew install zsh

# Oh-my-zsh and zshrc
curl -L http://install.ohmyz.sh | sh
sudo chsh -s $(whoami) $(which zsh)
ln -s ~/.zshrc ~/.dotfiles/zshrc
source ~/.zshrc

# Global gitignore
ln -s ~/.gitignore_global ~/.dotfiles/gitignore_global
git config --global core.excludesfile '~/.gitignore'

# vimrc
mkdir ~/.vim
ln -s ~/.vim/vimrc ~/.dotfiles/vimrc
ln -s ~/.vimrc ~/.vim/vimrc
