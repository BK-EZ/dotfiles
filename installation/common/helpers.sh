#!/bin/bash
#
# Utility functions used by setup scripts.
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
