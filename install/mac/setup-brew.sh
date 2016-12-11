#!/bin/bash
#
# Install brew, brew cask, and all brew packages
set -e
set -u

install_brew() {
  echo -e "${Cya}Installing homebrew...${RCol}"
  if [[ ! $(which brew) ]]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_brewcask() {
  echo -e "${Cya}Installing brew caskroom...${RCol}"
  brew tap caskroom/cask
  brew tap caskroom/versions
}

install_brew_packages() {
  echo -e "${Cya}Installing brew packages...${RCol}"
  handle_file "brew install" "$BASEDIR/packages/brew.txt"
}

install_brewcask_packages() {
  echo -e "${Cya}Installing brew cask packages...${RCol}"
  handle_file "brew cask install" "$BASEDIR/packages/brew-cask.txt"
}

setup_brew() {
  install_brew
  install_brewcask
  install_brew_packages
  install_brewcask_packages
}
