#!/bin/bash

src_fldr=$1
check_fldr=$2
# maintain audio fldr & transcriptions.txt

echo "started"
#fldrs=$(find "$src_fldr" -maxdepth 1 -type d)
#echo $fldrs
#for fld in $fldrs; do
   # txt_file=$(find "$fld" -maxdepth 1 -type f -name '*.txt' )  #2>/dev/null)
    #if [ -n "$txt_file" ]; then
     # echo "Text files in '$fld':"
      #echo "$txt_file"
     # mv $txt_file "$fld/audio/"
    #  cd "$fld/audio/" || exit
    #  awk '{filename = $1 ".txt"; $1=""; print $0 > filename}' transcripts.txt   #change this "text name" 
    #  mv * ../
    #  cd ../
    #  rm -rf $txt_file audio/

      # check all .txt and .wav names are matching either move to check_wav_txt folder
for wav in "$fld"/*.wav; do
   txt="${wav%.wav}.txt"
   if [ ! -e "$txt" ]; then
      echo "Moving $wav to $check_fldr"
      mv "$wav" "$check_fldr"
   fi
done
for txt in "$fld"/*.txt; do
   wav="${txt%.txt}.wav"
   if [ ! -e "$wav" ]; then
      echo "Moving $txt to $check_fldr"
      mv "$txt" "$check_fldr"
   fi
done
      
#    fi
#  done
  echo "done!!!!!!!"
