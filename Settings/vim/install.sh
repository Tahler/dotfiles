#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

# Install Vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ] ; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi

# Link vimrc
rc_file="$HOME/.vimrc"
if [ -f "$rc_file" ] ; then
  rm "$rc_file"
fi
ln "${SCRIPT_PATH}/.vimrc" "$rc_file"

# Link color scheme
mkdir -p "$HOME/.vim/colors"
color_file="$HOME/.vim/colors/custom-material.vim"
if [ -f "$color_file" ] ; then
  rm "$color_file"
fi
ln "${SCRIPT_PATH}/custom-material.vim" "$color_file"

# Install vim plugins
vim +PluginInstall +qall

