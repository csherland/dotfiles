#!/bin/bash
#
# Author:   Christian Sherland
# Created:  6/23/14
# Modified: 6/27/14
#
# install.sh
#   Setup script for my dotfiles on an OSX machine. Also installs
#   some useful utilities and applications. See the readme for a
#   full description of what is installed in this script.
#

# CD to home for good measure
cd ~

# Homebrew! (and related setup)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo export PATH='/usr/local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Required brew utilities
brew install caskroom/cask/brew-cask
brew install git
brew install wget
brew install macvim
brew install zsh

# Some useful casks (non app-store apps)
brew cask install adium
brew cask install atom
brew cask install dropbox
brew cask install google-chrome
brew cask install iterm2
brew cask install spotify
brew cask install vlc

# Inconsolata font because it is awesome
brew tap caskroom/fonts
brew cask install font-inconsolata-dz-for-powerline

# Oh-my-zsh and zshrc
curl -L http://install.ohmyz.sh | sh
sudo chsh -s $(whoami) $(which zsh)
rm ~/.zshrc
ln -s ~/.zshrc ~/.dotfiles/zshrc
source ~/.zshrc

# vimrc
mkdir ~/.vim
ln -s ~/.vim/vimrc ~/.dotfiles/vimrc
ln -s ~/.vimrc ~/.vim/vimrc

# Vim setup
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~

# Global gitignore
ln -s ~/.gitignore_global ~/.dotfiles/gitignore_global
git config --global core.excludesfile '~/.gitignore'
