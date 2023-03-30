#!/bin/sh


while read line; do

  username=$(echo "$line" | cut -d',' -f1)
  echo "deleting the user: $username"
  userdel --remove $username

done < $1

if [ -e /home/PUBKEYS ]; then
  echo "deleting /home/PUBKEYS"
  rm /home/PUBKEYS
fi

