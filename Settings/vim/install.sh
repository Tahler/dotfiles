#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

# Install Vundle if not already installed
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ] ; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
fi

# Link `.vimrc`
rc_file="$HOME/.vimrc"
if [ -a "$rc_file" ] ; then
  rm -r "$rc_file"
fi
ln "${SCRIPT_PATH}/.vimrc" "$rc_file"

# Link file specific settings
# Note: this is destructive - removes `~/.vim/ftplugin` directory if it exists
ftplugin_dir="$HOME/.vim/ftplugin"
if [ -a "$ftplugin_dir" ] ; then
  rm -r "$ftplugin_dir"
fi
ln -s "${SCRIPT_PATH}/ftplugin" "$ftplugin_dir"

# Link color scheme
# Note: this is destructive - removes `~/.vim/colors` directory if it exists
colors_dir="$HOME/.vim/colors"
if [ -a "$colors_dir" ] ; then
  rm -r "$colors_dir"
fi
ln -s "${SCRIPT_PATH}/colors" "$colors_dir"

# Install plugins
vim +PluginInstall +qall

