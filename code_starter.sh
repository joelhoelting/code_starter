#!/bin/bash

usage_statement="Usage: 'code_starter js|rb|py|php"
root_directory=$( dirname $0 )
date=$(date +'%d-%m-%y')

open_file() {
  local filename=$1
  local language=$2
  if [ -f $filename ]; then
    read -p "File already exists, edit file (y/n): " answer
    [[ $answer == [Yy]* ]] && vim $filename || exit 1
  else
    cp "${root_directory}/templates/initial.${language}" $filename
    vim $filename
  fi
}

if [ $# -ne 1 ]; then   
  echo "Please choose a programming language"
  echo $usage_statement && exit 1
fi

language=$1

case $language in
  js)
    extension='.js'
    ;;
  rb)
    extension='.rb'
    ;;
  py)
    extension='.py'
    ;;
  php)
    extension='.php'
    ;;
  *)
    echo 'Invalid Option'
    echo $usage_statement && exit 1
    ;;
esac

code_directory=$root_directory/code
language_directory=$code_directory/$language

read -p "Entire filename (extension automatically generated): " fileroot

if ! [ -z $fileroot ]; then
  if [ ! -d $root_directory ]; then
    mkdir $root_directory
  fi

  if [ ! -d $code_directory ]; then
    mkdir $code_directory
  fi

  if [ ! -d $language_directory ]; then
    mkdir $language_directory
  fi

  filename=${date}_${fileroot}${extension}
  full_filename=${language_directory}/${filename}

  open_file $full_filename $language
else 
  echo 'File must have at least 1 character'
fi
