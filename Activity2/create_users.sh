#!/bin/bash

touch /home/PUBKEYS

while read line; do

  username=$(echo "$line" | cut -d',' -f1)
  password=$(echo "$line" | cut -d',' -f2)

  echo "the username: $username, and the password: $password" 

  # Create the user account
  useradd $username
  echo "$username:$password" | chpasswd

   
  mkdir -p /home/$username/KEYS/
  # Generate RSA keys for the user
  openssl genrsa -out /home/$username/KEYS/$username.key 4096
  openssl rsa -in /home/$username/KEYS/$username.key -pubout -out /home/$username/KEYS/$username.pub
  chmod 600 /home/$username/KEYS/$username.key 
  chmod 644 /home/$username/KEYS/$username.pub 
  chown -R $username:$username /home/$username/KEYS 
   
  # Add the user's public key to the PUBKEYS file
  echo "" >> /home/PUBKEYS
  echo "$username" >> /home/PUBKEYS
  echo -n "$(cat /home/$username/KEYS/$username.pub)" >> /home/PUBKEYS

done < $1

chmod -w /home/PUBKEYS
chmod g-w /home/PUBKEYS

