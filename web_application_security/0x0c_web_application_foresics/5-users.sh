#!/bin/bash
grep -Ei "useradd|new user|added user" auth.log \
| awk '{for(i=1;i<=NF;i++) if ($i=="user") print $(i+1)}' \
| sort -u \
| paste -sd, -
