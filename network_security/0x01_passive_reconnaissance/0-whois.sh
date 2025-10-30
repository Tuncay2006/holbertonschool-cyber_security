#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/ {gsub(/^[ \t]+|[ \t]+$/,"",$2); f=$1; gsub(/^[ \t]+|[ \t]+$/,"",f); if(f~/Street/){a[f]=$2" "}; print f","$2}' > "$1.csv"
