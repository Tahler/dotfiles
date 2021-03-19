#!/bin/bash

if ! dpkg -s stow > /dev/null ; then
  apt-get -y install stow
fi

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASE_DIR}"

stow git tmux unix vim vs-code zsh
