#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/ && !/Registry/ {gsub(/^[ \t]+|[ \t]+$/,"",$2); f=$1; gsub(/^[ \t]+|[ \t]+$/,"",f); if(f~/Street/) $2=$2" "; sub(/Ext$/,"Ext:",f); out=f","$2; lines[++n]=out} END{for(i=1;i<n;i++) print lines[i]; printf "%s", lines[n]}' | tee "$1.csv"
