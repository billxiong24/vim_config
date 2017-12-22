#!/bin/bash
FILE="urls.txt"
DIR="bundle"
cd ".vim/"

mkdir "$DIR"

while read -r line; do
    dirname=$(basename "$line" .git)

    git submodule add "$line" $DIR/"$dirname"
done < ../$FILE
