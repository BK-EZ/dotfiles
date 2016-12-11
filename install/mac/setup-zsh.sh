#!/bin/bash
#
# Install zsh, oh-my-zsh, and oh-my-zsh themes
set -e
set -u

update_shellsfile() {
  echo -e "${Cya}Installing /etc/shells file..${RCol}."
  sudo cp $BASEDIR/shell/shells /etc/shells
}

install_ohmyzsh() {
  echo -e "${Cya}Uninstalling oh-my-zsh if present...${RCol}"
  sudo rm -rf $HOME/.oh-my-zsh

  echo -e "${Cya}Installing oh-my-zsh...${RCol}"
  git clone https://github.com/robbyrussell/oh-my-zsh $HOME/.oh-my-zsh

  echo -e "${Cya}Installing zsh themes...${RCol}"
  cp $BASEDIR/zsh-themes/* $HOME/.oh-my-zsh/themes/

  echo -e "${Cya}Installing .zshrc...${RCol}"
  cp $BASEDIR/shell/zshrc $HOME/.zshrc
}

use_zsh() {
  echo -e "${Cya}Changing default shell to zsh...${RCol}"
  sudo chsh -s $(which zsh)
}

setup_zsh() {
  update_shellsfile
  install_ohmyzsh
  use_zsh
}
