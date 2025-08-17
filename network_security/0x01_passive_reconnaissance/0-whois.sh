#!/bin/bash
whois $1 | awk '/^(Registrant|Admin|Tech)/ {key=$1; val=substr($0,length($1)+2); sub(/^[ \t]+|[ \t]+$/,"",key); sub(/^[ \t]+|[ \t]+$/,"",val); print key "," val}' > $1.csv
