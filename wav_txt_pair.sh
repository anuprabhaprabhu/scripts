#!/bin/bash

fld=$1
check_fldr=$2

# check all .txt and .wav names are matching either move to check_wav_txt folder
for wav in "$fld"/*.wav; do
  txt="${wav%.wav}.txt"
  if [ ! -e "$txt" ]; then
    echo "Moving $wav to $check_fldr"
    mv "$wav" "$check_fldr"
  fi
done

# Check for unmatched .txt files
for txt in "$fld"/*.txt; do
  wav="${txt%.txt}.wav"
  if [ ! -e "$wav" ]; then
    echo "Moving $txt to $check_fldr"
    mv "$txt" "$check_fldr"
  fi
done
      
