#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#

# Check for Homebrew
if test ! $(which brew)
then
  echo "Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Utilities
brew install git
brew install htop
brew install macvim --override-system-vim
brew install cmake
brew install node
brew install the_silver_searcher
brew install zsh

# Casks (non app-store apps)
brew install caskroom/cask/brew-cask
brew cask install amethyst
brew cask install iterm2
brew cask install spotify
brew cask install vlc

# Inconsolata font, because it's awesome
brew tap caskroom/fonts
brew cask install font-inconsolata-dz-for-powerline

# Symlink installed apps
brew linkapps

# Success
exit 0
