#!/bin/bash
#
# Select an enviornment to install onto.
set -e
set -u
readonly BASEDIR=$(dirname "$0")
source "$BASEDIR/install/mac/setup-mac.sh"

main() {
  setup_mac
}

main
