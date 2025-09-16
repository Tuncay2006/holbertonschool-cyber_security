#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 {xor}BASE64" >&2
  exit 1
fi

input="$1"
payload="${input#\{xor\}}"

printf "%s" "$payload" | base64 -d 2>/dev/null | \
  perl -0777 -ne 'print join("", map { chr(ord($_) ^ 0x5f) } split(//, $_));'
echo
