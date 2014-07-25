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

# Change to home directory for good measure
cd ~

# Homebrew! (and related setup)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
echo export PATH='/usr/local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

# Brew utilities
brew install caskroom/cask/brew-cask
brew install git
brew install htop
brew install macvim --override-system-vim
brew install wget
brew install zsh

# Some useful casks (non app-store apps)
brew cask install adium
brew cask install atom
brew cask install dropbox
brew cask install flux
brew cask install google-chrome
brew cask install handbrake
brew cask install iterm2
brew cask install skype
brew cask install spotify
brew cask install steam
brew cask install vlc

# Inconsolata font, because it's awesome
brew tap caskroom/fonts
brew cask install font-inconsolata-dz-for-powerline

# Oh-my-zsh and zshrc
curl -L http://install.ohmyz.sh | sh
sudo chsh -s $(whoami) $(which zsh)
rm ~/.zshrc
ln -s ~/.dotfiles/zshrc ~/.zshrc
source ~/.zshrc

# vimrc
mkdir ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vim/vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# Vim setup
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
cd ~

# Configure location of iterm2 preferences
defaults write com.googlecode.iterm2 PrefsCustomFolder "/Users/$(whoami)/.dotfiles/"

# Global gitignore
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global
git config --global core.excludesfile '~/.gitignore'

# Configure git user (You will likely want to change this)
git config --global user.name "Christian"
git config --global user.email christiansherland@gmail.com

# Configure htop to display information properly (requires sudo)
sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop

