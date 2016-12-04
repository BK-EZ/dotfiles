#!/usr/bin/env bash
set -e

echo "Setting up enviornment..."

DOTFILES=$(dirname "$0")

cp $DOTFILES/zsh-themes/* $ZSH/themes/
cp $DOTFILES/zshrc/dot_zshrc $HOME/.zshrc

echo "Enviornment successfully set up!"
