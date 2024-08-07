# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

source $DOTFILES/aliases.zsh
source $DOTFILES/path.zsh

# Use Starship
eval "$(starship init zsh)"

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# pnpm
export PNPM_HOME="/Users/acacia/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export TINYTEX_INSTALLER=TinyTeX-2

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# bun completions
[ -s "/Users/acacia/.bun/_bun" ] && source "/Users/acacia/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$PATH":"$HOME/.pub-cache/bin"

# Created by `pipx` on 2024-07-01 18:16:14
export PATH="$PATH:/Users/acacia/.local/bin"
