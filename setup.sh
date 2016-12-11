#!/bin/bash
#
# Select an enviornment to install onto.
set -e
set -u
readonly BASEDIR=$(dirname "$0")

source $BASEDIR/install/setup-mac.sh
source $BASEDIR/install/setup-linux.sh

source $BASEDIR/install/helpers/colors.sh
source $BASEDIR/install/helpers/handle-file.sh

main() {
  while :; do
    ask_for_env
  done
}

ask_for_env() {
  local readonly options=(
    "Auto-Detect"
    "Mac"
    "Linux"
    "Exit"
  )

  echo -e "${Cya}Which enviornment would you like to install onto?${RCol}"
  select input in "${options[@]}"; do
    case $input in
        "${options[0]}" ) auto_detect; break;;
        "${options[1]}" ) setup_mac; break;;
        "${options[2]}" ) setup_linux; break;;
        "${options[3]}" ) ask_if_sure; break;;
    esac
  done
}

ask_if_sure() {
  local readonly options=(
    "Heck Yes"
    "Heck No"
  )

  echo -e "${Cya}Are you ${BCya}sure${Cya} you want to exit?${RCol}"
  select input in "${options[@]}"; do
    case $input in
      "${options[0]}" ) echo "Goodbye friend"; exit 0;;
      "${options[1]}" ) break;;
    esac
  done
}

auto_detect() {
  if [ "$(uname)" == "Darwin" ]; then
    echo -e "${Cya}Detected Mac OS${RCol}"
    setup_mac
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo -e "${Cya}Detected Linux OS${RCol}"
    setup_linux
  else
    >&2 echo -e "${Red}Failed to detect OS!${RCol}"
  fi
}

main
