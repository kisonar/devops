#!/usr/bin/env bash
BASE_PATH=./input-files
ARCHIVE_PATH=${BASE_PATH}/archive
FILES_ZIP=${BASE_PATH}/*.zip
value="*"
for file in $FILES_ZIP
do
  echo "Processing file $file"
  fileName=${file##*/}
  echo "File name: $fileName"
  pureFileName=${fileName%.*}
  echo "pureFileName : $pureFileName"

  if [[ -w $file ]]; then
    echo "Extracting archive $fileName ..."
    unzip -o -d ./input-files $file
    echo "Extraction completed"
    mv $file ${ARCHIVE_PATH}/$fileName
    echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
  else
    echo "File $file is not zip. Skipping..."
  fi
done
