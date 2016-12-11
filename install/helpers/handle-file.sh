#!/bin/bash
#
# Perform a command taking in each line of a file as a
# paramater to that command.

set -e
set -u

handle_file() {
  local readonly cmd="$1"
  local readonly filename="$2"
  while IFS='' read -r lineFromFile || [[ -n "$lineFromFile" ]]; do
    local fullCmd="$cmd $lineFromFile"
    $fullCmd
  done < "$filename"
}
