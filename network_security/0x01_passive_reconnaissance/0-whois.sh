#!/bin/bash
whois "$1" | awk -F': ' '/Information/ && /Registrant|Admin|Tech/ {print $1","$2}'
