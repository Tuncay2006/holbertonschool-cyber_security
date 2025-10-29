#!/bin/bash
showmount -e "$1" 2>/dev/null | tail -n +2 | awk '{c=($2=="")?"everyone":$2; print $1 " (" c ")"}'
