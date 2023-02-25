#! /bin/env bash

######################################################################
# Cleans up backup files left behind by install.sh
#
# Find all files with '~' suffixes (the default backup suffix used by
# `install`). Prompts the user before deleting each one.
######################################################################

set -eu

cleanup_dir=${1:-$HOME}

printf "Going to clean up all backup config files in %s\n" "$cleanup_dir"
find "$cleanup_dir" -maxdepth 5 -name "\.*~" -ok rm -v {} \;
