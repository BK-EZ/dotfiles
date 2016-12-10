#!/bin/bash
#
# Install brew, brew cask, and all brew packages
set -e
set -u

install_brew() {
  echo "Installing homebrew..."
  if [[ ! $(which brew) ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_brewcask() {
  echo "Installing brew caskroom..."
  brew tap caskroom/cask
  brew tap caskroom/versions
}

install_brew_packages() {
  echo "Installing brew packages..."
  handle_file "brew install" "$BASEDIR/packages/brew.txt"
}

install_brewcask_packages() {
  echo "Installing brew cask packages..."
  handle_file "brew cask install" "$BASEDIR/packages/brew-cask.txt"
}

setup_brew() {
  install_brew
  install_brewcask
  install_brew_packages
  install_brewcask_packages
}
