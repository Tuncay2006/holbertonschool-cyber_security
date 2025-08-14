#!/bin/bash
sudo ufw allow 80/tcp
sudo ufw deny proto tcp from any to any port 1:79,81:65535
