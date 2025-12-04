#!/bin/bash
grep -Ei "iptables.*-A|ufw.*added|firewall:.*add" auth.log | wc -l
