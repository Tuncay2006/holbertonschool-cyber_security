#!/bin/bash
grep -Ei "useradd|new user|added user|account created|creating user" auth.log \
| grep -oE "[A-Za-z0-9_-]+" \
| grep -Ev "useradd|user|new|added|account|created|creating|uid|gid|shell|sudo|by|for|from|session" \
| sort -u \
| paste -sd, -
