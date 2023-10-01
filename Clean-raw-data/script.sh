#!/bin/bash

# Author : FLavien-Pictet

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

sed 's/^[ \t]*//;s/[ \t]*$//' "$input_file" > "$output_file"
sed -i 's/","/,/g' "$output_file"
sed -i 's/","/ /g' "$output_file"
sed -i 's/"//g' "$output_file"
sed -i 's/,/","/g' "$output_file"

echo "Data cleaning and formatting complete. Output file: $output_file"
