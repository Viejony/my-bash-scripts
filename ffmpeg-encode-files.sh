#!/bin/bash

# Parameters
inputFormat="mkv"
outputFormat="mp4"
outputFolder="converted"

# Get files in current foldwr
files=()
while IFS= read -r -d '' file; do
  files+=("$file")
done < <(find . -type f -name "*.$inputFormat" -print0)

# Creates a folder with defined name
mkdir $outputFolder

# Itereates over files array and call ffmpeg converter tool in every iteration
for file in "${files[@]}"
do
  #echo "$file"
  ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i "$file" -c:a copy -b:a 128k -c:v av1_nvenc -b:v 5M "$outputFolder${file%.inputFormat}.$outputFormat"
done
