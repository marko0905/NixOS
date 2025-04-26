# ==================== Zsh Setup ====================
# Needs Homebrew, git, JetBrainsMono Nerd Font, oh-my-posh, stow

# Homebrew is a package manager for macOS and enable it to zsh
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# < brew list > List of brew instaled packages


# ========== Zinit Setup ==========
# Zinit is a flexible and fast Zsh plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if not already installed
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
## Use command < zinit zsetup > to check zinit status
## Use command < zinit self-update > to update zinit
## Use command < zinit update > to update all plugins


# ========== Add in zsh plugins ==========
## highlight syntax in zsh plugin
zinit light zsh-users/zsh-syntax-highlighting
## completion plugin for zsh
zinit light zsh-users/zsh-completions
## zsh plugin for auto-suggestions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
# zinit snippet OMZL::git.zsh

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# ========== Initialize oh-my-posh ==========
# Oh My Posh is a prompt theme engine for any shell
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/posh.toml)"
fi

# History (autosugestions plugin)
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Aliases
alias c='clear'
alias csleep='pmset sleepnow' # Sleep computer
alias coff='sudo shutdown -h now' # Shutdown computer
alias crestart='sudo reboot' # Restart computer
alias nixupdate='nix flake update --flake ~/.dotfiles' # update NixOS from flake
alias nixbuild='sudo nixos-rebuild switch --flake ~/.dotfiles' # build NixOS from flake
alias hmbuild='home-manager switch --flake ~/.dotfiles'	#build the home manager from flake
alias nixclean='nix-collect-garbage' # NixOS garbagecolect

# ========== NVM Setup ==========
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ========== Yazi Setup ==========
## When using yazi, open in VSCode
export EDITOR="code"
## Function to call yazi with y command
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
