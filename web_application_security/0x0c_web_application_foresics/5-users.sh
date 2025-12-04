#!/bin/bash
grep -Ei "useradd|new user|added user" auth.log \
| awk '{print $NF}' \
| sort -u \
| paste -sd, -
