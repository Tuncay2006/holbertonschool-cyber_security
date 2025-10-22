#!/usr/bin/env bash
gzip -dc /home/kali/Downloads/rockyou.txt.gz > /tmp/rockyou.txt && john --wordlist=/tmp/rockyou.txt --format=raw-md5 "$1" && john --show --format=raw-md5 "$1" | cut -d: -f2 > 4-password.txt
