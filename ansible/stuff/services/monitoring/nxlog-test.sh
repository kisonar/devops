#!/usr/bin/env bash
find ./nxlog/files/input ! -name 'input.log' -type f -exec rm -f {} +
cat /dev/null > ./nxlog/files/output/out.csv
cat /dev/null > ./nxlog/files/output/out.json

#copy templates ready
#cp -a ./nxlog/files-testing-templates/txt/. ./nxlog/files/input

for i in {1..25}
do
   echo "Welcome file $i"
   current_date=$(date +"%Y%m%d")
   #echo "Current date: $current_date"

   for u in {1..73}
   do
      echo "Sign-Poland|$current_date|SUCCESS|$RANDOM" >> ./nxlog/files-testing-templates/txt/$i.txt
   done
  echo "file generation completed"

  #copy templates ready
  # cp -a ./nxlog/files-testing-templates/txt/$i.txt ./nxlog/files/input/$i.txt
  echo "copying generated file completed"
  sleep 0
done

# Add Fin entries
for i in {1..346}
do
  echo "Sign-Finland|$current_date|Nightwish|$RANDOM" >> ./nxlog/files-testing-templates/txt/NP_AAE_FIN.txt

done

# Add GER entries
for i in {1..456}
do
  echo "Sign-Germany|$current_date|Rammstein|$RANDOM" >> ./nxlog/files-testing-templates/txt/NP_AAE_GER.txt

done



cp -a ./nxlog/files-testing-templates/txt/. ./nxlog/files/input