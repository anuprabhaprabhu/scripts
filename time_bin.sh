src_fld=$1
src_fmt=$2
tot_dur=$3   # in hrs
train=$4    #create this  folder



dur=0.0
tot_dur=$(echo "scale = 3; $tot_dur*3600" | bc)  # to sec
echo $tot_dur


for file in $(find $src_fld -type f -name "*.$src_fmt"); 
do

    t=$(soxi -D $file)
    tot_dur=$(echo "$tot_dur - $t" | bc)
    comp=$(echo "$tot_dur > $dur" | bc)

    if [ $comp = '1' ]; then 
        file_name=$(basename "${file}")
        b=`echo $file_name | cut -d '.' -f1 `
        echo  -e  ${b} '\t' $file  >> $train/wav.scp
        echo  -e  ${b} '\t' ${b}  >> $train/utt2spk

        # to copy files to another folder
        #cp -r ${file} /home/anuprabha/ASR_22/5hr/
        
    else     
        break
    fi    
done

echo $tot_dur
