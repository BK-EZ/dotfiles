#!/usr/bin/env bash
#
# Install dotfiles and other resources to the enviornment.

set -e
set -u

echo "Setting up enviornment..."

echo "Setting path to script..."
DOTFILES=$(dirname "$0")

echo "Installing zsh..."
apt-get install zsh -y

echo "Uninstalling oh-my-zsh if present..."
sudo rm -rf $HOME/.oh-my-zsh

echo "Installing oh-my-zsh..."
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh

echo "Installing zsh-themes..."
cp $DOTFILES/zsh-themes/* $HOME/.oh-my-zsh/themes/

echo "Installing .zshrc file..."
cp $DOTFILES/zshrc/dot_zshrc $HOME/.zshrc

echo "Changing default shell to zsh..."
sudo chsh -s $(which zsh) $(whoami)

echo "Enviornment successfully set up! Please restart the session for changes to be applied!"
