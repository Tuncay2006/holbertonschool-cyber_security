#!/bin/bash
whois google.com | awk -F: '/Registrant|Admin|Tech/ {gsub(/^ +/,"",$2); print $1 "," $2}'
