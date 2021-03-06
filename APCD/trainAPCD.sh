#!/bin/bash

set -e # exit if an error occurs.

printf "## Training GloVe Models for Arabic Poem Comprehensive Corpora:\n"

cd poemsACPD/

filename='../ages'
IFS=$'\n'; n=1
while read line; do
    make --directory=../GloVe-Arabic/
    CORPUS=$line
    VOCAB_FILE=vocab_$line
    COOCCURRENCE_FILE=cooccurrence.bin
    COOCCURRENCE_SHUF_FILE=cooccurrence.shuf.bin
    BUILDDIR=build
    SAVE_FILE=vectors_$line
    VERBOSE=2
    MEMORY=8.0
    VOCAB_MIN_COUNT=1
    VECTOR_SIZE=256
    MAX_ITER=20
    WINDOW_SIZE=15
    BINARY=2
    NUM_THREADS=8
    X_MAX=10

    printf  "\n   # Importing Vocabulary for '$line'..."

    printf  "\n   # Counting GloVe Cooccurrences:\n"
    ../GloVe-Arabic/$BUILDDIR/cooccur -memory $MEMORY -vocab-file ../vocabsAPCD/$VOCAB_FILE -verbose $VERBOSE -window-size $WINDOW_SIZE < $CORPUS > $COOCCURRENCE_FILE

    printf  "   # Shuffling GloVe Cooccurrences:\n"
    ../GloVe-Arabic/$BUILDDIR/shuffle -memory $MEMORY -verbose $VERBOSE < $COOCCURRENCE_FILE > $COOCCURRENCE_SHUF_FILE

    printf  "   # Fitting GloVe Model on '$line':\n"
    ../GloVe-Arabic/$BUILDDIR/glove -save-file $SAVE_FILE -threads $NUM_THREADS -input-file $COOCCURRENCE_SHUF_FILE -x-max $X_MAX -iter $MAX_ITER -vector-size $VECTOR_SIZE -binary $BINARY -vocab-file ../vocabsAPCD/$VOCAB_FILE -verbose $VERBOSE

    printf  "   # Removing Unnecessary Directories & Files ...\n"
    make --directory=../GloVe-Arabic/ clean
    rm -rf *.bin

    sleep 1 ; n=$((n+1)) ; printf "\n"
done < $filename

cd ..

if [ -d "vectorsAPCD" ]
then
  printf "      >> Directory 'vectorsAPCD' already exists!\n"
else
  mkdir vectorsAPCD
fi

mv poemsACPD/vectors_* vectorsAPCD/

printf "## Training GloVe Models for Arabic Poem Comprehensive Corpora is Done. \n\n"
