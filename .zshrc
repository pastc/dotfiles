# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

ZSH_CUSTOM=$DOTFILES

# Use Starship
eval "$(starship init zsh)"

# User configuration

# You may need to manually set your language environment
export LC_ALL=en_JP.UTF-8
export LANG=en_JP.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"