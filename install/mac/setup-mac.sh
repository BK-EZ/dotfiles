#!/bin/bash
#
# set up a mac dev enviornment

set -e
set -u

readonly BASEDIR="$1"
source $BASEDIR/install/common/helpers.sh
source $BASEDIR/install/mac/install-zsh.sh

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

main() {
  echo "Begining installation for mac os setup"
  say "here we go boys"

  install_brew
  install_brew_caskroom
  install_brew_packages
  install_brew_caskroom_packages
  install_zsh

  echo "mac os enviornment successfully setup!"
  say "great job"
}

main
