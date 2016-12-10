#!/bin/bash
#
# set up a mac dev enviornment
set -e
set -u

source $BASEDIR/installation/common/helpers.sh

install_brew() {
  echo "Installing homebrew..."
  if [[ ! $(which brew) ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_brew_caskroom() {
  echo "Installing brew caskroom..."
  brew tap caskroom/cask
  brew tap caskroom/versions
}

install_brew_packages() {
  echo "Installing brew packages..."
  handle_file "brew install" "$BASEDIR/packages/brew.txt"
}

install_brew_caskroom_packages() {
  echo "Installing brew cask packages..."
  handle_file "brew cask install" "$BASEDIR/packages/brew-cask.txt"
}

install_zsh() {
  echo "Installing /etc/shells file..."
  sudo cp $BASEDIR/shell/shells /etc/shells

  echo "Uninstalling oh-my-zsh if present..."
  sudo rm -rf $HOME/.oh-my-zsh

  echo "Installing oh-my-zsh..."
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh

  echo "Installing zsh themes..."
  cp $BASEDIR/zsh-themes/* $HOME/.oh-my-zsh/themes/

  echo "Installing .zshrc..."
  cp $BASEDIR/shell/zshrc $HOME/.zshrc

  echo "Changing default shell to zsh..."
  sudo chsh -s $(which zsh)

  echo "changing env to zsh..."
  env zsh
}

main() {
  echo "Begining installation for mac os setup"
  say "here we go boys"

  local readonly BASEDIR=$(dirname "$0")

  install_brew
  install_brew_caskroom
  install_brew_packages
  install_brew_caskroom_packages
  install_zsh

  echo "mac os enviornment successfully setup!"
  say "great job"
}

main
