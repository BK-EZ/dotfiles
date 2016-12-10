#!/bin/bash
#
# Select an enviornment to install onto.
set -e
set -u
readonly BASEDIR=$(dirname "$0")

main() {
  $BASEDIR/install/mac/setup-mac.sh "$BASEDIR"
}

main
