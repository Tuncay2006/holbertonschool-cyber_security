#!/bin/bash
command -v hashcat >/dev/null 2>&1 && hashcat -a 1 --stdout "$1" "$2" || while IFS= read -r w1; do while IFS= read -r w2; do echo "${w1}${w2}"; done < "$2"; done < "$1"
