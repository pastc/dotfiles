#!/bin/sh

echo "Setting up your Mac..."

# Check for Starship and install if we don't have it
if test ! $(which starship); then
  /bin/sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

# Check for pnpm and install if we don't have it
if test ! $(which pnpm); then
  /bin/sh -c "$(curl -fsSL https://get.pnpm.io/install.sh)"
fi

# Check for kitty and install if we don't have it
if test ! $(which kitty); then
  /bin/sh -c "$(curl -fsSL https://sw.kovidgoyal.net/kitty/installer.sh)"
fi

# Install Node using pnpm env
pnpm env use --global lts

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Removes .config from $HOME (if it exists) and symlinks the .config dir from the .dotfiles
rm -rf $HOME/.config
ln -sw $HOME/.dotfiles/config $HOME/.config

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set Keka as the default compression application
/Applications/KekaExternalHelper.app/Contents/MacOS/KekaExternalHelper -s

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos
