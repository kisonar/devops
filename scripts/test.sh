#!/usr/bin/env bash

$files ll -a | grep -i *.zip

for file in files
  unzip -o -d ./ file
  mv file ./archive/


