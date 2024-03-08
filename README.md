## My Dotfiles
This repository contains my personal configuration dotfiles for Bash and Zsh shells, along with a setup for Oh My Zsh (OMZ), to maintain a consistent and efficient working environment across different machines.

## Contents

Bash config .bashrc file for customizing the Bash shell.

Zsh config .zshrc file for customizing the Zsh shell.

Oh My Zsh config

install.sh script to automate the setup process.

## Installation

### Clone Repo
 ```bash

git clone https://your-repo-url.git ~/.dotfiles
 ```

### Run the install.sh

 ```bash
Copy code
cd ~/.dotfiles
./install.sh
```

## Using the Dotfiles

The .bashrc and .zshrc files are configured to enhance your shell experience with aliases, functions, and custom prompts.
The install.sh script will set Zsh as your default shell, install Oh My Zsh, and create symbolic links for the dotfiles to the home directory.
After running the install script, you may need to log out and log back in or restart your terminal for the changes to take effect.
