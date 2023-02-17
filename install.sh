#! /bin/env bash

set -eu

dotfile_install() {
  local src_file="$1"
  local dest_file="$2"

  echo "installing $src_file..."
  install --mode=444 --backup=numbered --verbose "$src_file" "$dest_file"
}

dotfile_install "vimrc"  "$HOME/.vimrc"
dotfile_install "bashrc" "$HOME/.bashrc"
