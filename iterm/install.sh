#!/bin/bash
#
# iterm/install.sh
#   Configures iterm2 with my custom preferences
#

# Configure location of iterm2 preferences
defaults write com.googlecode.iterm2 PrefsCustomFolder "/Users/$(whoami)/.dotfiles/"

