#!/bin/bash
whois "$1" | awk -F: '/Registrant|Admin|Tech/{k=$1;v=$2;sub(/^[ \t]+|[ \t]+$/,"",k);sub(/^[ \t]+|[ \t]+$/,"",v);keys[++i]=k;vals[i]=v}END{for(j=1;j<=i;j++)printf "%s%s",keys[j],(j<i?",":"\n");for(j=1;j<=i;j++)printf "%s%s",vals[j],(j<i?",":"\n")}' > "$1.csv"
