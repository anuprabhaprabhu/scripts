src_fld=$1
src_fmt=$2
dest_fld=$3

export src_fmt dest_fld

find "$src_fld" -type f -name "*.$src_fmt" -exec bash -c '
    file="{}"
    file_name=$(basename "$file")
    b=$(echo "$file_name" | cut -d "." -f1)
    content=$(< "$file")
    echo -e "${b}\t$content" >> "$dest_fld/text"

' \;
echo "Done !!!!!!!! "

