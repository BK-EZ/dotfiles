#!/bin/bash
#
# set up a mac dev enviornment

set -e
set -u

source $BASEDIR/install/common/helpers.sh
source $BASEDIR/install/mac/setup-brew.sh
source $BASEDIR/install/mac/setup-zsh.sh

setup_mac() {
  echo "Begining installation for mac os setup"
  say "here we go boys"

  setup_brew
  setup_zsh

  echo "mac os enviornment successfully setup!"
  say "great job"
}
