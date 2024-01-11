import pandas as pd


df = pd.read_json("/asr3/anuprabha/data_te/cstd/g/data.json")

out = '/asr3/anuprabha/data_te/cstd/g/transcripts.txt'
with open(out, "w") as f_out:
    f_out.write("\n".join(df["audioFilename"]+'\t'+ df["text"]))

print('Done')
