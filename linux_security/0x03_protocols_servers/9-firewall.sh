#!/bin/bash
sudo iptables -F
sudo iptables -P INPUT DROP && sudo iptables -A INPUT -i lo -j ACCEPT && sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
