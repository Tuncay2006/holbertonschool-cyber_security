#!/bin/bash
whois $1 | awk '/Registrant|Admin|Tech/ {split($0,a,":"); key=a[1]; sub(/^[ \t]+|[ \t]+$/,"",key); val=substr($0,length(a[1])+2); sub(/^[ \t]+|[ \t]+$/,"",val); print key "," val}' > $1.csv
