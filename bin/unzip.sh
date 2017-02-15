#!/bin/bash

# Unzips all .zip files in a directory. Does not recurse further.
# $1 = Input directory containing all the zip files
# $2 = Output directory to contain all of the unzipped files.

GREEN='\033[0;32m'
NC='\033[0m' # No Color

find $1 -maxdepth 1 -name '*.zip' -type f -print0 | while read -d '' -r zip
do
  echo -e "Unzipping ${GREEN}$zip${NC}"
  unzip "$zip" -d $2
  echo -e "${GREEN}done.${NC}"
done
