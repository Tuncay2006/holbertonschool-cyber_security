#!/bin/bash
grep -i "new user" auth.log \
| grep -oE "name=[^,]+" \
| cut -d= -f2 \
| sort -u \
| paste -sd, -
