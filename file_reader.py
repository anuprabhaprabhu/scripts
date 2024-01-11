import os
import pandas as pd

path_to_json = '/asr2/Telugu_corpus/CSTD/'
json_files = []

for root, dirs, files in os.walk(path_to_json):
    for f in files:
        if f.endswith('data.json'):      #Check for .json exten
            json_files.append(os.path.join(root, f))    #append full path to file


for file in json_files:
    print(file)
    df = pd.read_json(file)
    with open(file, "w") as f_out:
        f_out.write("\n".join(df["audioFilename"]+'\t'+ df["text"]))


print('Done')

