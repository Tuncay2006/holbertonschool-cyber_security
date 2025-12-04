#!/bin/bash
grep "Accepted password for root" auth.log \
| grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' \
| sort -u \
| wc -l
