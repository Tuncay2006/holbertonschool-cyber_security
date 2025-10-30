#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/ && !/Registry/ {gsub(/^[ \t]+|[ \t]+$/,"",$2); f=$1; gsub(/^[ \t]+|[ \t]+$/,"",f); if(f~/Street/) $2=$2" "; sub(/Ext$/,"Ext:",f); print f","$2}' | tee "$1.csv"
