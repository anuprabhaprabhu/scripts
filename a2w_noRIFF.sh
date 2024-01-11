#!/bin/bash

#ffmpeg -i g1_JF_spk_0_2.wav -acodec pcm_alaw -sample_fmt s16 -ar 8000 g1_JF_spk_0_2_a-law.wav



src_folder=$1
src_fmt=$2
des_fmt=$3
des_sampling_rate=$4

for file in $(find $src_folder -type f -name "*.$src_fmt" ) ; do 
  file_name=$(basename $file)
  mv $file /tmp/$file_name
  ffmpeg -loglevel warning -hide_banner -stats -i /tmp/$file_name -acodec pcm_s16le -sample_fmt s16 -ac 1 -ar $des_sampling_rate ${file%%.*}.$des_fmt
  rm -rf /tmp/$file
done

