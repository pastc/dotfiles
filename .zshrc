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
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/acacia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/acacia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/acacia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/acacia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
