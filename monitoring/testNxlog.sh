#!/usr/bin/env bash
find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
cat /dev/null > ./nxlog/files/output/out.csv
cat /dev/null > ./nxlog/files/output/out.json
cp -a ./nxlog/files-testing/. ./nxlog/files/input