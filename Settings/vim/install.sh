#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

ln -s "${SCRIPT_PATH}/.vimrc" ~/.vimrc
mkdir -p "~/.vim/colors"
ln -s "${SCRIPT_PATH}/ubuntu.vim" ~/.vim/colors/ubuntu.vim

