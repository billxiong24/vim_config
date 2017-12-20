#!/bin/bash
FILE="urls.txt"
touch $FILE

for dir in */ ; do
    cd "$dir" || exit 1;
    url=$(git remote -v | cut -f2 | cut -d ' ' -f1 | head -n 1)
    echo "$url"
    echo "$url" >> $FILE
    cd ../ || exit 1;
done
