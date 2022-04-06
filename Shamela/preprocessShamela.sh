#!/bin/bash

# set -e # exit if an error occurs.

preprocessingTools(){
  camel_arclean |  camel_dediac | camel_word_tokenize | tr -d "[:alnum:]" | tr -d "[:punct:]"
}

printf "## Preprocessing Shamela Library 'doc' Books:"
printf "\n   # Finding & Extracting All Books Written Before 1900 & After 1900 ..."

ls allTextBooks/ >> allTextBooks.txt

cd allTextBooks/ ; n=1
filename='../allTextBooks.txt'
while read -r line; do
  cat "$line" | head -n20 | awk '/المتوفى/ {print}' | grep -o '[0-9]\+' | awk 'NR==1{print $1}' | { read -d '' year; echo "$year" | if [ "$year" -lt 1317 ] 2>/dev/null; then echo "$line">>../allBooksBefore1900.txt; fi; }
  cat "$line" | head -n20 | awk '/المتوفى/ {print}' | grep -o '[0-9]\+' | awk 'NR==1{print $1}' | { read -d '' year; echo "$year" | if [ "$year" -ge 1317 ] 2>/dev/null; then echo "$line">>../allBooksAfter1900.txt; fi; }
  n=$((n+1))
done < $filename

cd ..

printf "\n   # Concatenating All 'txt' Books Written Before 1900 ..."
if [ -d "allTextBooksBefore1900" ]
then
  printf "\n      >> Directory 'allTextBooksBefore1900' already exists!"
else
  mkdir allTextBooksBefore1900
fi

cd allTextBooks ; n=1
filename='../allBooksBefore1900.txt'
while read -r line; do
  cp $line  ../allTextBooksBefore1900/
  n=$((n+1))
done < $filename

cd ../allTextBooksBefore1900/
cat *.txt > ../shamela_corpus_unprocessed_before1900 ; cd ..

printf "\n   # Concatenating All 'txt' Books Written After 1900 ..."
if [ -d "allTextBooksAfter1900" ]
then
    printf "\n      >> Directory 'allTextBooksAfter1900' already exists!"
else
    mkdir allTextBooksAfter1900
fi

cd allTextBooks ; n=1
filename='../allBooksAfter1900.txt'
while read -r line; do
  cp $line ../allTextBooksAfter1900/
  n=$((n+1))
done < $filename

cd ../allTextBooksAfter1900/
cat *.txt > ../shamela_corpus_unprocessed_after1900 ; cd ..

printf "\n   # Manually Concatenating All 'txt' Books Written Before Islam (610AD) ..."
if [ -d "allTextBooksBeforeIslam" ]
then
    printf "\n      >> Directory 'allTextBooksBeforeIslam' already exists!"
else
    mkdir allTextBooksBeforeIslam
fi

cd allTextBooksBefore1900/
mv ديوان_الأفوه_الأودي.doc.txt ../allTextBooksBeforeIslam/
mv ديوان_امرئ_القيس_ت_المصطاوي.doc.txt ../allTextBooksBeforeIslam/
mv ديوان_طرفة_بن_العبد.doc.txt ../allTextBooksBeforeIslam/

cd ../allTextBooksBeforeIslam/
cat *.txt > ../shamela_corpus_unprocessed_beforeIslam ; cd ..

printf "\n   # Creating & Preprocessing 'shamelaCorpusBeforeIslam' ..."
cat shamela_corpus_unprocessed_beforeIslam | preprocessingTools > shamelaCorpusBeforeIslam

printf "\n   # Creating & Preprocessing 'shamelaCorpusBefore1900' ..."
cat shamela_corpus_unprocessed_before1900 | preprocessingTools > shamelaCorpusBefore1900

printf "\n   # Creating & Preprocessing 'shamelaCorpusAfter1900' ..."
cat shamela_corpus_unprocessed_after1900 | preprocessingTools > shamelaCorpusAfter1900

printf "\n   # Creating & preprocessing 'shamelaCorpusAll' ..."
cat shamela_corpus_unprocessed* | preprocessingTools > shamelaCorpusAll

if [ -d "shamelaCorpora" ]
then
  printf "\n      >> Directory 'shamelaCorpora' already exists!"
else
  mkdir shamelaCorpora
fi

mv shamelaCorpus* shamelaCorpora/
rm -rf shamela_*_unp* *.txt *.tmp/ zips

printf "\n## Preprocessing Shamela Library Books is Done.\n\n"
