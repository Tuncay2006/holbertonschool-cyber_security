#!/bin/bash
grep -i "sshd" auth.log | awk '{print $5}' | sort | uniq -c | sort -nr
