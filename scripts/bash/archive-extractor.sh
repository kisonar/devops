#!/usr/bin/env bash
BASE_PATH=/home/importer/ftp
ARCHIVE_PATH=${BASE_PATH}/archive
FILES_ZIP=${BASE_PATH}/*.zip
FILES_TAR=${BASE_PATH}/*.tar
FILES_TAR_GZ=${BASE_PATH}/*.tar.gz
FILES_TAR_BZ2=${BASE_PATH}/*.tar.bz2

extraction_function_zip(){
for file in $FILES_ZIP
  do
    echo "Processing file: $file"
    fileName=${file##*/}
    echo "File name: $fileName"
    filePureName=${fileName%.}
    echo "pureFileName : $filePureName"
    fileExtension=${fileName##*.}
    echo "fileExtension : $fileExtension"
    if test -f $file; then
      echo "Extracting archive $fileName ..."
      unzip -o -d $BASE_PATH $file
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    else
      echo "None zip to extract...."
    fi
  done
}

extraction_function_tar(){
for file in $FILES_TAR
  do
    echo "Processing file: $file"
    fileName=${file##*/}
    if test -f $file; then
      echo "Extracting archive $fileName ..."
      tar -xvf $file -C $BASE_PATH
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    fi
  done
}

extraction_function_tar_gz(){
for file in $FILES_TAR_GZ
  do
    echo "Processing file: $file"
    fileName=${file##*/}
    if test -f $file; then
      echo "Extracting archive $fileName ..."
      tar -xzvf $file -C $BASE_PATH
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    fi
  done
}

extraction_function_tar_bz2(){
for file in $FILES_TAR_BZ2
  do
    echo "Processing file: $file"
    fileName=${file##*/}
    if test -f $file; then
      echo "Extracting archive $fileName ..."
      tar -xjvf $file -C $BASE_PATH
      echo "Extraction completed"
      mv $file ${ARCHIVE_PATH}/$fileName
      echo "Moved $file to ${ARCHIVE_PATH}/$fileName"
    fi
  done
}

extraction_function_zip
extraction_function_tar
extraction_function_tar_gz
extraction_function_tar_bz2
