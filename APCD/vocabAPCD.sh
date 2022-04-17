#!/bin/bash

set -e # exit if an error occurs.

printf "## Building Vocabulary for Arabic Poem Comprehensive Dataset:\n"

mkdir -p vocabsAPCD

gcc GloVe-Arabic/src/vocab_count.c -o vocabsAPCD/vocab_count -lm -pthread -Ofast -funroll-loops -Wall -Wextra -Wpedantic

cd poemsACPD/

filename='../ages'
IFS=$'\n'; n=1
while read line; do
    CORPUS=$line
    VOCAB_FILE=vocab_$CORPUS
    VERBOSE=2
    VOCAB_MIN_COUNT=1
		printf "   # Using GloVe to Build Vocabulary for '$line':"
    ../vocabsAPCD/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > ../vocabsAPCD/$VOCAB_FILE
    sleep 1 ; n=$((n+1))
done < $filename

cd .. ; rm -rf vocabsAPCD/vocab_count

printf "## Building Arabic Poem Comprehensive Dataset Vocabulary is Done. \n\n"
