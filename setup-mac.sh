#!/bin/bash
#
# set up a mac dev enviornment

echo "Begining installation for mac os setup"
say "here we go boys"

readonly BASEDIR=$(dirname "$0")

echo "Installing /etc/shells file..."
sudo cp $BASEDIR/shell/shells /etc/shells

echo "Installing zsh..."
brew install zsh

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
