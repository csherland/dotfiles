#!/bin/bash
#
# zsh/install.sh
#   install oh-my-zsh and set zsh as the default shell
#

curl -L http://install.ohmyz.sh | sh
sudo chsh -s $(which zsh) $(whoami)
