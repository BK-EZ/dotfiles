#!/bin/bash
#
# Select an enviornment to install onto.
set -e
set -u
readonly BASEDIR=$(dirname "$0")
source "$BASEDIR/install/mac/setup-mac.sh"

main() {
  while :; do
    ask_for_env
  done
}

ask_for_env() {
  options=(
    "Auto-Detect"
    "Mac"
    "Linux"
    "Exit"
  )

  echo "Which enviornment would you like to install onto?"
  select input in "${options[@]}"; do
    case $input in
        "${options[0]}" ) echo no!; break;;
        "${options[1]}" ) setup_mac; break;;
        "${options[2]}" ) echo no!; break;;
        "${options[3]}" ) ask_if_sure; break;;
    esac
  done
}

ask_if_sure() {
  echo "Are you sure you want to exit?"
  select input in "Heck Yes" "Heck No"; do
    case $input in
      "Heck Yes" ) echo "Goodbye friend"; exit 0;;
      "Heck No" ) break;;
    esac
  done
}

main
