#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

conf_file="$HOME/.gitconfig"
if [ -f "$conf_file" ] ; then
  rm "$conf_file"
fi
ln "${SCRIPT_PATH}/.gitconfig" "$conf_file"

