#!/bin/bash

files=$(ls | grep ".mp4")
folder="converted"

for t in ${files[@]}; do
    ffmpeg -i $t -c:v libx265 -crf 26 -preset medium -c:a aac -b:a 128k $folder/$t
done