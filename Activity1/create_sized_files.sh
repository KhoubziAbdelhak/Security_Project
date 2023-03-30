#!/bin/sh

while read line; do

  size="$line"
  ./create_file.sh $size

done < files_sizes.txt

