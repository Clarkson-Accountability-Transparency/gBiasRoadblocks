#!/bin/bash

set -e # exit if an error occurs.

printf "## Building Vocabulary for Arabic Poem Comprehensive Dataset:\n"

mkdir -p vocabAPCD

gcc GloVe-Arabic/src/vocab_count.c -o vocabAPCD/vocab_count -lm -pthread -Ofast -funroll-loops -Wall -Wextra -Wpedantic

cd Poems/

filename='../ages'
IFS=$'\n'; n=1
while read line; do
    CORPUS=$line
    VOCAB_FILE=vocab_$CORPUS
    VERBOSE=2
    VOCAB_MIN_COUNT=1
		printf "   # Using GloVe to Build Vocabulary for '$line':"
    ../vocabAPCD/vocab_count -min-count $VOCAB_MIN_COUNT -verbose $VERBOSE < $CORPUS > ../vocabAPCD/$VOCAB_FILE
    sleep 1 ; n=$((n+1))
done < $filename

cd .. ; rm -rf vocabAPCD/vocab_count

printf "## Building Arabic Poem Comprehensive Dataset Vocabulary is Done. \n\n"
