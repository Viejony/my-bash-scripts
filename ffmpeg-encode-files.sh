#!/bin/bash

files=$(ls | grep ".mp4")
folder="converted"

# Creates a folder
mkdir $folder

# Itereates over mp4 files
for t in ${files[@]}; do
    ffmpeg -i $t -c:v libx265 -crf 26 -preset medium -c:a aac -b:a 128k $folder/$t
    # Example with Nvidia GPU
    # ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i $t -c:a copy -c:v av1_nvenc -b:v 5M $folder/$t
done
