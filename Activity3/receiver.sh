#!/bin/bash

shared_secret="mysecretkey"

# Wait for message from sender
echo "Waiting for message from sender..."
while [ ! -f message.txt ]
do
  sleep 1
done

# Read message and HMAC from file
message=$(cat message.txt | cut -d '|' -f 1)
hmac=$(cat message.txt | cut -d '|' -f 2)

# Verify HMAC
if [ "$hmac" == "$(echo -n "$message" | openssl dgst -sha256 -hmac "$shared_secret" | awk '{print $2}')" ]; then
  echo "Message received successfully! Message: $message"
else
  echo "Message verification failed. HMAC mismatch!"
fi

# Clean up
rm message.txt

