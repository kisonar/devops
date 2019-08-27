#!/usr/bin/env bash
BASE_PATH=./input-files
ARCHIVE_PATH=${BASE_PATH}/archive
FILES_ZIP=${BASE_PATH}/*.zip

extraction_function(){

echo $1
for file in $1
  do
    echo "Processing file $file"
    fileName=${file##*/}
    echo "File name: $fileName"
    filePureName=${fileName%.*}
    echo "pureFileName : $filePureName"
    fileExtension=${fileName##*.}
    echo "fileExtension : $fileExtension"

    #if [[ -w $file ]]; then
      echo "Extracting archive $fileName ..."
      unzip -o -d ./input-files $file
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    #else
    #  echo "File $file is not zip nor tar. Skipping..."
    #fi
  done
}




extraction_function $FILES_ZIP
