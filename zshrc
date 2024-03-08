#testing
# Navigation aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # Home directory
alias -- -="cd -" # Previous directory

# Common directory shortcuts
alias docs="cd ~/Documents"
alias dls="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias proj="cd ~/Projects"

# List directory contents
alias ls="ls -lah --color"
alias l="ls -lah --color"
alias ll="ls -lAh --color"
alias la="ls -A --color"

# Handy shortcuts
alias dotfiles="cd ~/.dotfiles && nano zshrc"

# Refresh the .zshrc file
alias zshreload="source ~/.zshrc"

# Clear the screen
alias cls="clear"
eval $(/opt/homebrew/bin/brew shellenv)


