#!/bin/bash
whois "$1" | awk -F': ' 'BEGIN{ORS=""} /^Registrant |^Admin |^Tech /{gsub(/^ +| +$/,"",$2); if($1~/Street$/)$2=$2" "; if($1~/Ext$/)sub(/Ext$/,"Ext:"); print $1","$2"\\n"}' > "$1.csv"
