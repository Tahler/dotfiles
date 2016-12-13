#!/bin/sh

SCRIPT_PATH="$( cd "$( dirname "$0" )" && pwd )"

rc_file="$HOME/.inputrc"
if [ -f "$rc_file" ] ; then
  rm "$rc_file"
fi
ln "${SCRIPT_PATH}/.inputrc" "$rc_file"

source "$rc_file"

