#!/bin/bash
FILE="urls.txt"
DIR=".vim"

mkdir $DIR

while read -r line; do
    dirname=$(basename "$line" .git)

    git submodule add "$line" $DIR/"$dirname"
done < $FILE
