#!/bin/sh


declare -a my_array=$(ls -lS -r  ./$2/| grep -v '^total'| awk '{print $NF}')
echo "${my_array[@]}"

cd ./$2/

for file in ${my_array}; do

  number="${file//[!0-9]/}"
  echo -n "$number," >> ../$1.csv
  
  echo "Encrypting $file with ECB... "
  first_time=$( { time -f "%e" openssl enc -e -pbkdf2 -des-ede3 -in $file -out output -k hunter >/dev/null; } 2>&1 )
  rm output
  echo -n "$first_time," >> ../$1.csv
  
  echo "Encrypting $file with CBC... "
  second_time=$( { time -f "%e" openssl enc -e -pbkdf2 -des-ede3-cbc -in $file -out output -k hunter >/dev/null; } 2>&1 )
  rm output
  echo "$second_time" >> ../$1.csv

done




