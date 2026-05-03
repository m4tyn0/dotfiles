#!/usr/bin/env bash
set -e

DOTFILES="$HOME/.dotfiles"

IS_MAC=false
IS_LINUX=false
[[ "$OSTYPE" == "darwin"* ]] && IS_MAC=true
[[ "$OSTYPE" == "linux"* ]] && IS_LINUX=true

echo "==> Symlinking dotfiles..."
ln -sf "$DOTFILES/zshrc"        "$HOME/.zshrc"
ln -sf "$DOTFILES/bashrc"       "$HOME/.bashrc"
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"

echo "==> Installing tools..."

if $IS_MAC; then
  if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval $(/opt/homebrew/bin/brew shellenv)
  fi
  brew install starship eza bat fzf zoxide fd zsh-autosuggestions zsh-syntax-highlighting

elif $IS_LINUX; then
  # detect package manager
  if command -v apt &>/dev/null; then
    sudo apt update
    sudo apt install -y zsh fzf zsh-autosuggestions zsh-syntax-highlighting

    # install via cargo/standalone where apt packages are outdated
    if ! command -v starship &>/dev/null; then
      curl -sS https://starship.rs/install.sh | sh -s -- --yes
    fi
    if ! command -v eza &>/dev/null; then
      sudo apt install -y gpg
      sudo mkdir -p /etc/apt/keyrings
      wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
      echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
      sudo apt update && sudo apt install -y eza
    fi
    if ! command -v bat &>/dev/null; then
      sudo apt install -y bat
      # ubuntu names it batcat
      command -v batcat &>/dev/null && mkdir -p ~/.local/bin && ln -sf /usr/bin/batcat ~/.local/bin/bat
    fi
    if ! command -v zoxide &>/dev/null; then
      curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
    if ! command -v fd &>/dev/null; then
      sudo apt install -y fd-find
      mkdir -p ~/.local/bin && ln -sf "$(which fdfind)" ~/.local/bin/fd
    fi

  elif command -v dnf &>/dev/null; then
    sudo dnf install -y zsh fzf bat fd-find zoxide
    if ! command -v starship &>/dev/null; then
      curl -sS https://starship.rs/install.sh | sh -s -- --yes
    fi
    if ! command -v eza &>/dev/null; then
      sudo dnf install -y eza
    fi
  fi
fi

echo ""
echo "==> Done. Reload your shell:"
echo "    source ~/.zshrc   (zsh)"
echo "    source ~/.bashrc  (bash)"
