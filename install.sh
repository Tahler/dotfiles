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

stow --target="$HOME" vim vs-code zsh

"$HOME/.fzf/install" --all --no-fish

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# if [ "$(uname -n)" == "penguin" ]; then
#   keybindings=(
#       "Super_L"
#       "<Alt>bracketleft"
#       "<Alt>bracketright"
#       "<Alt>tab"
#   )
#   for k in "${keybindings[@]}"; do
#     # vi /etc/systemd/user/sommelier*.service.d/cros-sommelier-{x-,}override.conf
#     # and append ",<Alt>tab,<Control_L><Alt_L>comma,<Control_L><Alt_L>period"
#     sudo tee -a /etc/systemd/user/sommelier*.service.d/cros-sommelier-{x-,}override.conf <<< "Environment=\"SOMMELIER_ACCELERATORS=$SOMMELIER_ACCELERATORS,$k\""
#   done
# fi
