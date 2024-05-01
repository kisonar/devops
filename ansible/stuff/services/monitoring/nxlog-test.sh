#!/usr/bin/env bash
find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
cat /dev/null > ./nxlog/files/output/out.csv
cat /dev/null > ./nxlog/files/output/out.json

#copy templates
cp -a ./nxlog/files-testing-templates/txt/. ./nxlog/files/input

for i in {1..32}
do
   echo "Welcome file $i"
   current_date=$(date +"%Y%m%d")
   #echo "Current date: $current_date"

   for u in {1..7345}
   do
      #echo "Welcome $u row"
      #current_date=$(date +"%Y%m%d")
      #echo "Current date: $current_date"
      echo "Sign-Poland|$current_date|SUCCESS|$RANDOM" >> ./nxlog/files-testing-templates/txt/$i.txt
   done
  echo "file generation completed"

  cp -a ./nxlog/files-testing-templates/txt/$i.txt ./nxlog/files/input/$i.txt
  echo "copying generated file completed"
  sleep 1
done
# cp -a ./nxlog/files-testing-templates/json/. ./nxlog/files/input