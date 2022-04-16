#!/bin/bash

set -e # exit if an error occurs.

printf "## Extracting Arabic Poem Comprehensive Dataset:\n"
printf "   # Downloading Arabic Poem Comprehensive Dataset (87MB):\n"
if [ -f "Arabic Poem Comprehensive Dataset (APCD).zip" ]
then
  printf "      >> File 'Arabic Poem Comprehensive Dataset (APCD).zip' already exists!"
else
  gdown -q "https://drive.google.com/uc?id=1xcb2p_TsQbexX9TIxfKMlLLcJvb-Dmly" & PID=$!
  printf "     ⚠ This will take a few seconds, please be patient!! \n"
  printf "     ["
  while kill -0 $PID 2> /dev/null; do
      printf "■"
      sleep 1
  done
  printf "] done."
fi

printf "\n   # Unzipping Arabic Poem Comprehensive Dataset ..."
unzip -q 'Arabic Poem Comprehensive Dataset (APCD).zip'
mv 'Arabic Poem Comprehensive Dataset (APCD).csv' APCD.csv

printf "\n   # Extracting Ages of The Arabic Poems ... "
awk -F, '{print $1}' APCD.csv | sort | uniq > ages
sed '/المخضرمين/d' ages > ages.tmp
sed '/العصر/d' ages.tmp > ages

printf "\n   # Exporting Arabic Poems Based-on-Ages to Files:"
filename='ages'
IFS=$'\n'; n=1
while read line; do
    printf "\n      >> Exporting Arabic Poems of Age '$line' ."
    awk -F , '$1 == "'$line'" { print }' APCD.csv | awk -F, '{print $8}' > $line
    sleep 1 ; n=$((n+1))
done < $filename

printf "\n   # Renaming All Arabic Poems Files Based-on-Ages ... "
if [ -d "Poems" ]
then
  printf "\n      >> Directory 'Poems' already exists!"
else
  mkdir Poems
fi

mv 'قبل الإسلام' Poems/PreIslamicAge
mv 'الإسلامي' Poems/IslamicAge
mv 'الأموي' Poems/UmayyadAge
mv 'المملوكي' Poems/MamlukAge
mv 'العباسي' Poems/AbbasidAge
mv 'الأيوبي' Poems/AyyubidAge
mv 'العثماني' Poems/OttomanAge
mv 'الفاطمي' Poems/FatimidAge
mv 'الحديث' Poems/ModernAge
mv 'بين الدولتين' Poems/btwUmayyadAbbasidAge
mv 'المغرب والأندلس' Poems/AndalusiaAge

printf "\n   # Concatenating All Ages of Arabic Poems ..."
cat Poems/* > Poems/allAPCD

rm -rf ages ages.tmp

printf "\n## Extracting Shamela Library Dataset is Done. \n\n"
