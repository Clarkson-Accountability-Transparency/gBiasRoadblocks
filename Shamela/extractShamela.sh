#!/bin/bash

set -e # exit if an error occurs.

printf "## Extracting Shamela Library Dataset:\n"
printf "   # Downloading Shamela Library Dataset (3.81GB):\n"
if [ -f "Shamela.zip" ]
then
  printf "      >> File 'Shamela.zip' already exists!"
else
  wget -q https://lin-web.clarkson.edu/class/cs675/2021fa/f21/alshahsf/gBiasRoadblocks/Shamela.zip & PID=$!
  printf "     ⚠ This may take a while, please be patient!! \n"
  printf "     ["
  while kill -0 $PID 2> /dev/null; do
      printf "■"
      sleep 5
  done
  printf "] done."
fi

if [ -d "Shamela.tmp" ]
then
  printf "\n      >> Directory 'Shamela.tmp' already exists!"
else
  mkdir Shamela.tmp
fi

printf "\n   # Processing Shamela Library Dataset ..."
7z e -y Shamela.zip -oShamela.tmp/ > /dev/null 2>&1

if [ -d "allZippedFiles.tmp" ]
then
    printf "\n     >> Directory 'allZippedFiles.tmp' already exists!"
else
    mkdir allZippedFiles.tmp
fi

mv Shamela.tmp/*.zip allZippedFiles.tmp/
rm -rf Shamela.tmp/

printf "\n   # Unzipping All Zipped Books Files ..."
cd allZippedFiles.tmp/
ls -l *.zip | awk '{ print $9 }' > zips
mv zips ../zips
IFS=$'\n' ; n=1
filename='../zips'
while read -r line; do
  7z e -y $line -o../allZippedFiles.tmp/ > /dev/null 2>&1
  n=$((n+1))
done < $filename

printf "\n   # Moving All 'doc' Books Files ..."
cd ..
if [ -d "allDocBooks" ]
then
  printf "\n      >> Directory 'allDocBooks' already exists!"
else
  mkdir allDocBooks
fi

mv allZippedFiles.tmp/*.doc allDocBooks/
rm -rf allZippedFiles.tmp/ zips

printf "\n   # Removing Whitespaces from All Books' Filenames ..."

if [ -d "allTextBooks" ]
then
  printf "\n      >> Directory 'allTextBooks' already exists!"
else
  mkdir allTextBooks
fi

cd allDocBooks/
for filename in *\ *; do mv "$filename" "${filename// /_}"; done > /dev/null 2>&1

printf "\n   # Converting All 'doc' Books Files to 'txt' Files ..."
find . -type f -name \*.doc -exec bash -c "antiword '{}' > ../allTextBooks/'{}'.txt" \;

cd ..

printf "\n## Extracting Shamela Library Dataset is Done. \n\n"
