#!/usr/bin/env bash
FILES_ZIP=./input-files/*.zip
for f in $FILES_ZIP
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  unzip -o -d ./input-files $f
  mv $file ./input-files/archive/
done