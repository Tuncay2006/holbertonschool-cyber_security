#!/bin/bash
logfile="${1:-logs.txt}"
attacker_ip=$(cut -d' ' -f1 "$logfile" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')
grep "^$attacker_ip " "$logfile" | awk -F\" '{print $6}' | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}'
