#!/usr/bin/env bash
gzip -dc /home/kali/Downloads/rockyou.txt.gz >/tmp/rockyou.txt && john --wordlist=/tmp/rockyou.txt --format=raw-sha256 "$1" >/dev/null 2>&1 && john --show --format=raw-sha256 "$1" | awk -F: 'NR==1{print $2}' > 6-password.txt && [ -s 6-password.txt ] && echo success
