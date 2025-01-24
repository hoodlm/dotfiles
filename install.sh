#! /bin/env bash

set -eu

dotfile_install() {
  local src_file="$1"
  local dest_file="$2"

  echo "Check if $src_file has changed..."
  install --compare --mode=444 --backup=numbered --verbose "$src_file" "$dest_file"
}

dotfile_install "vimrc"  "$HOME/.vimrc"
dotfile_install "bashrc" "$HOME/.bashrc"
dotfile_install "tmux.conf" "$HOME/.tmux.conf"
dotfile_install "kitty.conf" "$HOME/.config/kitty/kitty.conf"
dotfile_install "mpv.conf" "$HOME/.config/mpv/mpv.conf"
dotfile_install "config.fish" "$HOME/.config/fish/config.fish"
dotfile_install "gitconfig" "$HOME/.gitconfig"
dotfile_install "nvim.init.lua" "$HOME/.config/nvim/init.lua"
