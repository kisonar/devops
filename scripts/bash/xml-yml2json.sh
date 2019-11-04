#!/usr/bin/env bash

if [ "$1" != "" ]; then
    python3 /nx_tool/xml-yml2json.py $1
else
    echo "ERROR: Directory location of files for convertion YML to JSON is empty!"
fi