#!/bin/bash

message="Breaking Bad is the best."
shared_secret="mysecretkey"

# Compute HMAC
hmac=$(echo -n "$message" | openssl dgst -sha256 -hmac "$shared_secret" | awk '{print $2}')

# Encrypt the message before sending it


# Send message and HMAC to receiver
echo "$message|$hmac" > message.txt
echo "Message sent to receiver." 

