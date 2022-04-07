#!/bin/bash

set -e # exit if an error occurs.

printf "## Building Vocabulary for Shamela Library Dataset:\n"

ls shamelaCorpora/ > shamela

mkdir -p shamelaVocab

gcc GloVe-Arabic/src/vocab_count.c -o shamelaVocab/vocab_count -lm -pthread -Ofast -funroll-loops -Wall -Wextra -Wpedantic

cd shamelaCorpora/

filename='../shamela'
IFS=$'\n'; n=1
while read line; do
    CORPUS=$line
    VOCAB_FILE=vocab_$CORPUS
    VERBOSE=2
    VOCAB_MIN_COUNT=1
    printf "   # Using GloVe to Build Vocabulary for '$line':"
    ../shamelaVocab/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > ../shamelaVocab/$VOCAB_FILE
    sleep 1 ; n=$((n+1))
done < $filename

cd .. ; rm -rf shamela shamelaVocab/vocab_count

printf "## Building Shamela Library Dataset Vocabulary is Done. \n\n"
