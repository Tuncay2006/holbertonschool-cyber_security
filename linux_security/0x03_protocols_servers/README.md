#!/bin/bash
# Script to display all current iptables rules in a readable format, including line numbers

sudo iptables -L -v -n --line-numbers

