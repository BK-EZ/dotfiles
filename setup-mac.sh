#!/bin/bash
#
# set up a mac dev enviornment

main() {
  echo "Begining installation for mac os setup"
  say "here we go boys"

  readonly BASEDIR=$(dirname "$0")

  echo "Installing /etc/shells file..."
  sudo cp $BASEDIR/shell/shells /etc/shells

  echo "Installing homebrew..."
  if test ! $(which brew)
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  echo "Installing brew packages..."
  brew install zsh
  brew install git
  brew install pcre
  brew install zsh-completions

  echo "Installing brew caskroom..."
  brew tap caskroom/cask
  brew install brew-cask
  brew tap caskroom/versions

  echo "Installing brew cask packages..."
  brew cask install alfred
  brew cask install atom
  brew cask install discord
  brew cask install google-chrome
  brew cask install iterm2
  brew cask install spectacle
  brew cask install steam

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

  echo "mac os enviornment successfully setup!"
  say "great job"
}

main
