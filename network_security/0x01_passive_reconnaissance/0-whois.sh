#!/bin/bash
whois "$1" | awk -F': ' '/Registrant|Admin|Tech/ {gsub(/^ +| +$/, "", $2); sub(/Street$/,"Street "); sub(/Ext$/,"Ext:"); print $1 "," $2}' > "$1.csv"
