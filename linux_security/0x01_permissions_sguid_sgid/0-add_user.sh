#!/usr/bin/env bash
sudo useradd -m -s /bin/sh "$1"
echo "$1:$2" | sudo chpasswd
