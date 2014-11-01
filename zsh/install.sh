#!/bin/bash
#
# zsh/install.sh
#   install oh-my-zsh and set zsh as the default shell
#

git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo chsh -s $(which zsh) $(whoami)
