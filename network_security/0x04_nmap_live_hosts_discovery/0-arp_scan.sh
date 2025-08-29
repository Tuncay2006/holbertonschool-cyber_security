#!/bin/bash
# 0-arp_scan.sh
# Discover live hosts in a subnet using ARP scan with nmap
# Usage: sudo ./0-arp_scan.sh <subnet> (e.g. 192.168.1.0/24)
# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: sudo $0 <subnet>"
    exit 1
fi

SUBNET=$1

# Run nmap ARP scan (host discovery only, no port scan)
sudo nmap -sn -PR "$SUBNET"
