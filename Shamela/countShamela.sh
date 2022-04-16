#!/bin/bash

set -e # exit if an error occurs.

printf "## Exporting Counts of Shamela Library Dataset:\n"

printf "   # Exporting Counts of DS, OPS, and MPS Sets to CSV Files: \n"
cd shamelaVocab/ ; ls vocab_* > ../VCs ; cd ..
filename='VCs'
IFS=$'\n'; n=1
while read line; do
    python3 countShamela.py shamelaVocab/$line OPS.yaml MPS.yaml
    sleep 1 ; n=$((n+1))
done < $filename

if [ -d "shamelaCounts" ]
then
  printf "\n      >> Directory 'shamelaCounts' already exists!"
else
  mkdir shamelaCounts
fi

mv count_*.csv shamelaCounts/

printf "## Exporting Counts of Shamela Library Dataset is Done. \n\n"
