#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

# Install Vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ] ; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi

# Link `.vimrc`
rc_file="$HOME/.vimrc"
if [ -f "$rc_file" ] ; then
  rm "$rc_file"
fi
ln "${SCRIPT_PATH}/.vimrc" "$rc_file"

# Link color scheme
# Note: this is destructive - removes `~/.vim/colors` directory if it exists
colors_dir="$HOME/.vim/colors"
if [ -f "$colors_dir" ] ; then
  rm "$colors_dir"
fi
ln -s "${SCRIPT_PATH}/colors" "$colors_dir"

# Install plugins
vim +PluginInstall +qall

