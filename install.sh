#!/bin/bash

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${BASE_DIR}"

function exists() {
  type "$1" >/dev/null 2>/dev/null
}

function install_if_not_exists() {
  if ! exists "$1"; then
    sudo apt-get -y install "$1"
  fi
}

git submodule update --init --recursive

sudo apt-get update
install_if_not_exists git
install_if_not_exists ripgrep
install_if_not_exists stow
install_if_not_exists vim

stow --target="$HOME" git unix vim vs-code zsh

"$HOME/.fzf/install" --all --no-fish
