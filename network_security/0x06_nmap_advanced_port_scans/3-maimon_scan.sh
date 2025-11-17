#!/bin/bash
sudo nmap -sM -pftp,ssh,telnet,http,https -vv "$1"
