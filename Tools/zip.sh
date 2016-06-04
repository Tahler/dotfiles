#!/bin/bash

# Note - Only tested on MINGW 64

# Zips all directories contained in the target directory. Does not recurse further.
# $1 = The root level directory containing all git repositories.

# $1 = Input directory containing all the folders files.
# $2 = Output directory to contain all of the .zip files.

GREEN='\033[0;32m'
NC='\033[0m' # No Color

find "$1" -mindepth 1 -maxdepth 1 -type d -print0 | while read -d '' -r dir
do
  echo -e "Zipping ${GREEN}$dir${NC}"
  zip -r "$dir.zip" "$dir"
  echo -e "${GREEN}done.${NC}"
done
