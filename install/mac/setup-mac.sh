#!/bin/bash
#
# set up a mac dev enviornment

set -e
set -u

source $BASEDIR/install/helpers/handle-file.sh
source $BASEDIR/install/mac/setup-brew.sh
source $BASEDIR/install/mac/setup-zsh.sh
source $BASEDIR/install/helpers/colors.sh

setup_mac() {
  echo -e "${Cya}Begining installation for mac os setup${RCol}"
  say "here we go boys"

  setup_brew
  setup_zsh

  echo -e "${Gre}mac os enviornment successfully setup!${RCol}"
  say "great job"

  # env zsh exits ouput from the script
  echo -e "${Cya}Changing env to zsh...${RCol}"
  env zsh

  exit 0
}
