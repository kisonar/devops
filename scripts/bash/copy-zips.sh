#!/usr/bin/env bash

#clear archive from zips
rm -f ./input-files/archive/*.zip

#clear archive from txt
rm -f ./input-files/*.txt

#copy zips
cp ./input-files/zip/*.zip ./input-files