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
# Add this to your ~/.bashrc or ~/.zshrc file

alias venv_activate='
if ! python3 -m venv --help > /dev/null 2>&1; then
    echo "Installing venv..."
    python3 -m ensurepip --upgrade
fi

if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

echo "Activating virtual environment..."
source venv/bin/activate
'


# bun completions
[ -s "/Users/matyno/.bun/_bun" ] && source "/Users/matyno/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2024-07-18 10:45:33
export PATH="$PATH:/Users/matyno/.local/bin"
