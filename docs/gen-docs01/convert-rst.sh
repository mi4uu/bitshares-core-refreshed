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
#   pandoc "$f" -f rst -t markdown  -o "$dir/$filename.md"
#   pandoc "$f" -f rst -t markdown_mmd  -o "$dir/$filename.md"
#   pandoc "$f" -f rst -t markdown_strict  -o "$dir/$filename.md"
#   pandoc "$f" -f rst -t commonmark  -o "$dir/$filename.md"
#   pandoc "$f" -f rst -t gfm  -o "$dir/$filename.md"
  pandoc "$f" -f rst -t commonmark_x  -o "$dir/$filename.md"
  #pandoc "$f" -f rst -t markdown --reference-links true   -o "$dir/$filename.md"

done