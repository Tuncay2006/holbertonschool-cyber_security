#!/bin/bash
# 0-whois.sh

if [ -z "$1" ]; then
    echo "Usage: $0 domain"
    exit 1
fi

domain=$1
output="$domain.csv"

whois "$domain" | awk -F: '
/Registrant|Admin|Tech/ {
    # key ve value ayrımı yap
    key=$1
    sub(/^[ \t]+/, "", key)   # baştaki boşlukları sil
    sub(/[ \t]+$/, "", key)   # sondaki boşlukları sil

    value=$2
    sub(/^[ \t]+/, "", value)
    sub(/[ \t]+$/, "", value)

    if (value == "") value=""

    print key "," value
}' > "$output"
