#!/bin/sh

echo $1
filename="file_$1M"
echo "creating: $filename"

dd if=/dev/random of=./tools/$filename bs=$1M count=1


