#!/bin/bash
hashcat -m 0 -a 1 "$1" worldlist1.txt worldlist2.txt --quiet && hashcat -m 0 "$1" --show | awk -F: '{print $2}' > 9-password.txt
