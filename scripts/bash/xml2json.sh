#!/usr/bin/env bash

if [ "$1" != "" ]; then
    python xml2json.py  $1
else
    echo "ERROR: Directory location of files for convertion XML to JSON is empty!"
fi

