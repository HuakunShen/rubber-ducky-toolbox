import os
import shutil
import hashlib
import pandas as pd
import urllib.request


def download(url: str, dest: str):
    req = urllib.request.Request(url)
    req.add_header('User-agent', 'Mozilla 5.10')
    res = urllib.request.urlopen(req)
    with open(dest, "wb") as f:
        f.write(res.read())


def compare_md5(file1: str, file2: str) -> bool:
    md5sum1 = hashlib.md5(open(file1, 'rb').read()).hexdigest()
    md5sum2 = hashlib.md5(open(file2, 'rb').read()).hexdigest()
    return md5sum1 == md5sum2, md5sum1, md5sum2


if __name__ == '__main__':
    df = pd.read_csv("./update.csv", index_col=0)
    if os.path.exists("tmp"):
        shutil.rmtree("tmp")
    os.mkdir("tmp")
    for index, row in df.iterrows():
        download_filepath = f"./tmp/{row['filename']}"
        filepath = f"{row['root']}/{row['filename']}"
        download(row['url'], download_filepath)
        if not os.path.exists(filepath):
            print("file doesn't exist, I will download the files")
            shutil.move(download_filepath, filepath)
            continue
        same_md5, md5sum1, md5sum2 = compare_md5(download_filepath, filepath)
        if same_md5:
            print(f"same checksum for {filepath}")
        else:
            print(f"{filepath} md5 checksum doesn't match with record")
            shutil.move(download_filepath, filepath)
            print("updated file")
    df.to_csv("update.csv")
