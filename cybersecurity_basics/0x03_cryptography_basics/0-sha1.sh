#!/bin/bash
# Script that hashes a given password using SHA-1 and saves it to 0_hash.txt

# Check if a password argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <password>"
  exit 1
fi

# Hash the password using SHA-1 and save to 0_hash.txt
echo -n "$1" | sha1sum | awk '{print $1}' > 0_hash.txt
