#!/bin/bash
john --wordlist=/home/ramazan/holbertonschool-cyber_security/cybersecurity_basics/0x03_cryptography_basics --format=NT "$1"| cut -d ' ' -f 2 >5-password.txt
