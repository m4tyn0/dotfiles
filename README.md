## Dotflies
This repository contains my personal preference dotflies for both bash and zsh shells.


## Contents

Bash config .bashrc file for customizing the Bash shell.

Zsh config .zshrc file for customizing the Zsh shell.

install.sh script to automate the setup process.

## Installation

### Clone repo and run install.sh
 ```bash

git clone git@github.com:m4tyn0/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
 ```


## Using the Dotfiles

The .bashrc and .zshrc files are configured to enhance your shell experience with aliases, functions, and custom prompts.
The install.sh script will set Zsh as your default shell and create symbolic links for the dotfiles to the home directory.
After running the install script, you may need to log out and log back in or restart your terminal for the changes to take effect.
 ```bash
source $HOME/.zshrc 
 ```
