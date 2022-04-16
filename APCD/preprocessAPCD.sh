#!/bin/bash

set -e # exit if an error occurs.

preprocessingTools(){
  camel_arclean |  camel_dediac | camel_word_tokenize | tr -d "[:alnum:]" | tr -d "[:punct:]"
}

printf "## Preprocessing Arabic Poem Comprehensive Dataset:"

ls Poems/ > ages

cd Poems/

printf "\n   # Preprocessing Arabic Poems of All Ages:"

filename='../ages'
IFS=$'\n'; n=1
while read line; do
  printf "\n      >> Preprocessing Arabic Poems of Age '$line' ..."
  cat $line | preprocessingTools > $line.tmp
  sleep 1 ; mv $line.tmp $line
  n=$((n+1))
done < $filename

cd .. 

printf "\n## Preprocessing Arabic Poem Comprehensive Dataset is Done.\n\n"
