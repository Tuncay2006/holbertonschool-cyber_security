#!/bin/bash
whois $1 | awk -F: '/Registrant|Admin|Tech/{k=$1;v=$2;sub(/^[ \t]+/,"",k);sub(/[ \t]+$/,"",k);sub(/^[ \t]+/,"",v);sub(/[ \t]+$/,"",v);print k "," v}' > $1.csv
