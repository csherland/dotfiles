Christian Sherland's Dotfiles
==========================
A compliation of my OSX dotfiles including an installation script. Running the
installation script will install all required utilities as well as some useful
applications, and will then configure and setup all included dotfiles.

Usage
-----
To install all components, as well as a small selection of required packages run:

    git clone http://github.com/csherland/dotfiles ~/.dotfiles
    cd ~/.dotfiles
    install/bootstrap

**Note**: Xcode command line tools are required for mac users to install these dotfiles.
If you have not already done so, install the tools by running:

    xcode-select --install

Included Files
--------------
Along with the install script, this repository includes the following files:

    - gitignore_global
    - vimrc
    - zshrc
    - com.googlecode.iterm2.plist

Installed Utilities/Applications
--------------------------------
The provided instalation script installs a number of useful applications and
utilities. First and foremost is the Homebrew package manager for mac which is
used to install the tools and applications listed below.

#### Command line utilities:
    - brew-cask
    - git
    - htop
    - macvim
    - wget
    - zsh

Authors
-------
- Christian Sherland

Acknowledgments
---------------
A huge ammount of inspiration for the organization of this project (as well as
a few useful scripts) was taken from [Zack Holman's dotfiles](https://github.com/holman/dotfiles).

Additionally, the mac defaults script in this repo is a modified version of 
[Mathias Bynens' script](https://github.com/mathiasbynens/dotfiles/blob/master/.osx).


