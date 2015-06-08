#!/bin/sh
#
# iterm/install.sh
#   Configures iterm2 with my custom preferences
#

# Configure location of iterm2 preferences
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder true
defaults write com.googlecode.iterm2 PrefsCustomFolder "~/.dotfiles/iterm/"
