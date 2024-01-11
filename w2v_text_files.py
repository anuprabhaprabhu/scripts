import pandas as pd
path = '/asr2/Telugu_corpus/IS_OpenSLR_Te/wav_pretrain/Telugu_Openslr_labelled_17-08-2021_05-39/'
data = pd.read_csv(path+'text_content', sep="\t", header=None, names=["filename", "transcript"])
for index, row in data.iterrows():
    with open(path+row['filename'], 'w') as f:
        f.write(row['transcript'])
        f.close()
