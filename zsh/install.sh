#!/bin/bash
#
# zsh/install.sh
#   install oh-my-zsh and set zsh as the default shell
#
sudo chsh -s $(which zsh) $(whoami)
