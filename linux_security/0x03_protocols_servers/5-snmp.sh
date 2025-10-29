#!/bin/bash
grep -E '(^|[[:space:]])public([[:space:]]|$)' /etc/snmp/snmpd.conf 2>/dev/null
