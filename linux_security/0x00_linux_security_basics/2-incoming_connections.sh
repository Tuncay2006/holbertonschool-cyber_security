#!/bin/bash
# IPv4 için sadece TCP 80 numaralı porta gelen bağlantılara izin ver
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "Rules updated"

# IPv6 için aynı kural
sudo ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
echo "Rules updated (v6)"
