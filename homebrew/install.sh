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
brew install cmake
brew install git
brew install htop
brew install macvim
brew install node
brew install pt
brew install zsh

# Casks (non app-store apps)
brew install caskroom/cask/brew-cask
brew cask install alfred
brew cask install amethyst
brew cask install docker
brew cask install hyper
brew cask install iterm2
brew cask install intellij-idea-ce
brew cask install little-snitch
brew cask install private-internet-access
brew cask install rocket
brew cask install spotify
brew cask install visual-studio-code

# Inconsolata font, because it's awesome
brew tap caskroom/fonts
brew cask install font-inconsolata-dz-for-powerline
brew cask install font-fira-code

# Symlink installed apps
brew linkapps

# Success
exit 0
