#!/usr/bin/env bash
echo "SELinux status:                 $(getenforce 2>/dev/null || echo Disabled)"
