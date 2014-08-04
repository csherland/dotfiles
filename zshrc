#
# Christian sherland
# .zshrc
#   Zshell configurations
#

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# Aliases
alias cl='clear'
alias vim='mvim -v'
alias mongo-up='sudo mongod --fork --smallfiles --logpath /data/db/mongo.log --dbpath /data/db'
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
alias wsj='wsj.app -r ~/Developer/tesla-repos/wsj/'

# Specify plugins for ZSH
plugins=(git, brew, osx)
source $ZSH/oh-my-zsh.sh

# Path variables
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH

# Custom functions
function lcd () {
  cd "$@" && ls
}
