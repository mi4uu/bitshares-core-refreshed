#!/bin/bash

# Find all .rst files in the current directory and its subdirectories
find . -type f -name "*.rst" | while read -r f; do
  # Get the directory and filename without extension
  dir=$(dirname "$f")
  filename=$(basename "$f" .rst)
  
  # Create the output directory if it doesn't exist
  mkdir -p "$dir"
  
  # Convert the .rst file to .md
  echo "Converting $f to $dir/$filename.md"
  pandoc "$f" -f rst -t markdown --reference-links true --self-contained false -o "$dir/$filename.md"
done