#!/usr/bin/env bash

#clear archive from tars
rm -f ./input-files/archive/*.gz
rm -f ./input-files/archive/*.tar
rm -f ./input-files/archive/*.bz2

#clear archive from txt
rm -f ./input-files/*.txt

#copy zips
cp ./input-files/tar/*.gz ./input-files
cp ./input-files/tar/*.tar ./input-files
cp ./input-files/tar/*.bz2 ./input-files