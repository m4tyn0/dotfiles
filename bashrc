# ─── os detection ─────────────────────────────────────────────────────────────
IS_MAC=false
IS_LINUX=false
[[ "$OSTYPE" == "darwin"* ]] && IS_MAC=true
[[ "$OSTYPE" == "linux"* ]] && IS_LINUX=true

# ─── homebrew (mac only) ──────────────────────────────────────────────────────
if $IS_MAC && [[ -x /opt/homebrew/bin/brew ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi

# ─── path ─────────────────────────────────────────────────────────────────────
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.scripts:$PATH"

# go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
if $IS_MAC; then
  export GOROOT="$(brew --prefix golang 2>/dev/null)/libexec"
elif [[ -d /usr/local/go ]]; then
  export GOROOT=/usr/local/go
fi
export PATH="$PATH:$GOPATH/bin${GOROOT:+:$GOROOT/bin}"

# bun
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL" ]] && export PATH="$BUN_INSTALL/bin:$PATH"
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# deno
[[ -f "$HOME/.deno/env" ]] && . "$HOME/.deno/env"

# pnpm
if $IS_MAC; then
  export PNPM_HOME="$HOME/Library/pnpm"
else
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"

# cargo / rust
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# ─── navigation aliases ───────────────────────────────────────────────────────
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# ─── directory shortcuts ──────────────────────────────────────────────────────
alias docs="cd ~/Documents"
alias dls="cd ~/Downloads"
alias desk="cd ~/Desktop"
alias proj="cd ~/Projects"

# ─── ls → eza ─────────────────────────────────────────────────────────────────
if command -v eza &>/dev/null; then
  alias ls="eza -lah --icons=auto --group-directories-first"
  alias l="eza -lah --icons=auto --group-directories-first"
  alias ll="eza -lAh --icons=auto --group-directories-first"
  alias la="eza -a --icons=auto"
  alias lt="eza --tree --icons=auto --level=2"
else
  alias ls="ls -lah --color"
  alias l="ls -lah --color"
  alias ll="ls -lAh --color"
  alias la="ls -A --color"
fi

# ─── cat → bat ────────────────────────────────────────────────────────────────
if command -v bat &>/dev/null; then
  alias cat="bat --style=plain --paging=never"
  export BAT_THEME="TwoDark"
fi

# ─── misc aliases ─────────────────────────────────────────────────────────────
alias dotfiles="cd ~/.dotfiles && ${EDITOR:-nano} bashrc"
alias bashreload="source ~/.bashrc"
alias cls="clear"

# ─── fzf ──────────────────────────────────────────────────────────────────────
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
  export FZF_DEFAULT_OPTS="
    --color=bg+:#283457,bg:#1a1b26,spinner:#7aa2f7,hl:#565f89
    --color=fg:#c0caf5,header:#565f89,info:#7dcfff,pointer:#7aa2f7
    --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#7aa2f7
    --height=40% --layout=reverse --border=sharp --prompt='❯ '
  "
  if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  fi
fi

# ─── starship prompt ──────────────────────────────────────────────────────────
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# ─── zoxide (must be last) ────────────────────────────────────────────────────
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init bash)"
  alias cd="z"
fi
