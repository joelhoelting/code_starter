#!/bin/bash
usage_statement="Usage: 'hackerrank javascript|ruby|python|php|c++"

if [ $# -ne 1 ]; then   
  echo "Please choose a programming language"
  echo $usage_statement && exit 1
fi

root_directory="/home/joel/Dev/hackerrank/"
language=$1

if [[ $language =~ ^(javascript|ruby|python|php|c++)$ ]]; then 
  case $language in
    javascript)
      extension='.js'
      ;;
    ruby)
      extension='.rb'
      ;;
    python)
      extension='.py'
      ;;
    php)
      extension='.php'
      ;;
    c++)
      extension='.cpp'
      ;;
    *)
      echo $usage_statement
      ;;
  esac

  language_directory=${root_directory}${language}/
else
  echo $usage_statement && exit 1
fi

read -p "Entire filename (extension automatically generated): " fileroot
if ! [ -z $fileroot ]; then
  if [ ! -d $language_directory ]; then
    mkdir $language_directory
  fi

  filename=${fileroot}${extension}
  full_filename=${language_directory}${filename}
  vim $full_filename
else 
  echo 'File must have at least 1 character'
fi
