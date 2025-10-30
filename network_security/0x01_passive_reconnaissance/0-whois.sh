#!/bin/bash
whois -h whois.gandi.net "$1" | awk -F': ' '/^Registrant |^Admin |^Tech /{gsub(/^ +| +$/,"",$2); if($1~/Street$/)$2=$2" "; if($1~/Ext$/)sub(/Ext$/,"Ext:"); print $1","$2}' > "$1.csv"
