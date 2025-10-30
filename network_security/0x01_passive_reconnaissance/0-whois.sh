#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/ {gsub(/^[ \t]+|[ \t]+$/,"",$2); f=$1; gsub(/^[ \t]+|[ \t]+$/,"",f); if(f~/Street/){$2=$2" "}; print f","$2}'
