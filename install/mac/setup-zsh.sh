#!/bin/bash
#
# Install zsh, oh-my-zsh, and oh-my-zsh themes
set -e
set -u

update_shellsfile() {
  echo "Installing /etc/shells file..."
  sudo cp $BASEDIR/shell/shells /etc/shells
}

install_ohmyzsh() {
  echo "Uninstalling oh-my-zsh if present..."
  sudo rm -rf $HOME/.oh-my-zsh

  echo "Installing oh-my-zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh

  echo "Installing zsh themes..."
  cp $BASEDIR/zsh-themes/* $HOME/.oh-my-zsh/themes/

  echo "Installing .zshrc..."
  cp $BASEDIR/shell/zshrc $HOME/.zshrc
}

use_zsh() {
  echo "Changing default shell to zsh..."
  sudo chsh -s $(which zsh)

  echo "changing env to zsh..."
  env zsh
}

setup_zsh() {
  update_shellsfile
  install_ohmyzsh
  use_zsh
}
