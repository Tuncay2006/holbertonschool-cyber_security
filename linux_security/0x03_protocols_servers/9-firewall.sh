#!/bin/bash
sudo iptables -F
sudo iptables -A INPUT -i lo -j ACCEPT && sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT && sudo iptables -A INPUT -j DROP
