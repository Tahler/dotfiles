#!/bin/bash

# Runs `git clean -xdf` on every git repositories underneath the target directory.
# $1 = The root level directory containing all git repositories.

GREEN='\033[0;32m'
NC='\033[0m' # No Color

cd "$1"
ROOT_LEVEL=`pwd`

find -type d -print0 | while read -d '' -r dir
do
  cd "$dir"
  if [ -d .git ]; then
    echo -e "Cleaning ${GREEN}$dir${NC}"
    git clean -xdf
    echo -e "${GREEN}done.${NC}"
  fi
  cd "$ROOT_LEVEL"
done
