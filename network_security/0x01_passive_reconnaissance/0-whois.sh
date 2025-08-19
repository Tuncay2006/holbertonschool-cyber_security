#!/bin/bash
whois holberton.com | awk '/Registrant|Admin|Tech/ {print}'
