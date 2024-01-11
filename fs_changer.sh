#!/usr/bin/bash
inp=$1
out_fldr=$2
for file in "$inp"/*.wav; do
        base=$(basename -- "$file")
        base_noext="${base%.wav}"
        out="$out_fldr/$base_noext.wav"
        ffmpeg -i "$file" -ar 16000 "$out"
        echo "Done for $file ---->>>>  $out"
done

