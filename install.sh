#!/bin/bash

# Install Oh My Zsh if it's not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Symlink dotfiles
ln -sf $HOME/.dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -snf $HOME/.dotfiles/ssh $HOME/.ssh

# Vim configuration
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
# Nano configuration
ln -sf $HOME/.dotfiles/nanorc $HOME/.nanorc

# Attempt to source the Zsh configuration to apply changes
if [ -n "$ZSH_VERSION" ]; then
    echo "Attempting to source .zshrc to apply changes..."
    source $HOME/.zshrc || echo "Please source your .zshrc manually or restart your shell.   source $HOME/.zshrc "
elif [ -n "$BASH_VERSION" ]; then
    echo "Attempting to source .bashrc to apply changes..."
    source $HOME/.bashrc || echo "Please source your .bashrc manually or restart your shell.     source $HOME/.bashrc "
else
    echo "Installation complete. Please restart your shell or source your shell config file manually. source $HOME/.zshrc "
fi

