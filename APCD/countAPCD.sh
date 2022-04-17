#!/bin/bash

set -e # exit if an error occurs.

printf "## Exporting Counts of Arabic Poem Comprehensive Dataset:\n"

printf "   # Exporting Counts of DS, OPS, and MPS Sets to CSV Files: \n"
cd vocabsAPCD/ ; ls vocab_* > ../VCs ; cd ..
filename='VCs'
IFS=$'\n'; n=1
while read line; do
    python3 countAPCD.py vocabsAPCD/$line OPS.yaml MPS.yaml
    sleep 1 ; n=$((n+1))
done < $filename

if [ -d "countsAPCD" ]
then
  printf "\n      >> Directory 'countsAPCD' already exists!"
else
  mkdir countsAPCD
fi

mv count_*.csv countsAPCD/

printf "## Exporting Counts of Arabic Poem Comprehensive Dataset is Done. \n\n"
