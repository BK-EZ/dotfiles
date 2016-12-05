#!/usr/bin/env bash
#
# Install dotfiles and other resources to the enviornment.

set -e

echo "Setting up enviornment..."

DOTFILES=$(dirname "$0")

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


cp $DOTFILES/zsh-themes/* $ZSH/themes/
cp $DOTFILES/zshrc/dot_zshrc $HOME/.zshrc

echo "Enviornment successfully set up!"
