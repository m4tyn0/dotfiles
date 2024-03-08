#!bin/bash

# Symlink dotfiles
ln -sf $HOME/.dotfiles/bashrc $HOME/.bashrc
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc

# Vim and nano configuration
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
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

