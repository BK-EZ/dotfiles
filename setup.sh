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
  echo "Which enviornment would you like to install onto?"
  select input in "Mac" "Linux" "Auto-Detect" "Exit"; do
    case $input in
        Mac ) setup_mac; break;;
        Linux ) echo no!; break;;
        Auto-Detect ) echo no!; break;;
        Exit ) ask_if_sure; break;;
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
