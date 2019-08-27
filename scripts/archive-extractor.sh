#!/usr/bin/env bash
BASE_PATH=./input-files
ARCHIVE_PATH=${BASE_PATH}/archive
FILES_ZIP=${BASE_PATH}/*.zip

extraction_function(){

echo "Variable $1 is"

for file in $FILES_ZIP
  do
    echo "Processing file $file"
    #fileName=${file##*/}
    #echo "File name: $fileName"
    #filePureName=${fileName%.*}EXTENSION_ZIP
    #echo "pureFileName : $filePureName"
    #fileExtension=${fileName##*.}
    #echo "fileExtension : $fileExtension"

    if [[ -w $file ]]; then
      echo "Extracting archive $fileName ..."
      unzip -o -d ./input-files $file
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    else
      echo "File $file is not zip nor tar. Skipping..."
    fi
  done
}

extraction_function
