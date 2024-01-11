readarray -t my_array < <(jq -c '.[]' /asr2/Telugu_corpus/CSTD/conv/n/data.json)

# iterate through the Bash array
for item in "${my_array[@]}"; do
    #file_name=$(jq '.audioFilename' <<< "$item")
    a=`echo $(jq '.audioFilename' <<< "$item") | cut -c 2- | cut -d '.' -f1 `
    b=`echo $(jq '.text' <<< "$item") `
    echo  -e  ${a} '\t' ${b}   >> /asr2/Telugu_corpus/CSTD/conv/n/text

done
echo "done"    

