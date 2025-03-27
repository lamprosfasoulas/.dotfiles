#!/bin/bash

read -p "Enter filename: " filename

if [[ -z $filename ]]; then
    echo "Filename cannot be empty"
    exit 1
fi

outfile="$HOME/.secrets/$filename.gpg"


echo "Enter text you want to encypt (Press C-d to save)"
text=""
while IFS= read -r line;do
    text="$text\n$line"
done

if [[ -z $text ]]; then
    exit 1
fi

echo -e $text | gpg -c -a --no-symkey-cache --cipher-algo AES256 -o "$outfile" 

echo "File saved as $outfile"

