#!/bin/bash
sudo grep -Ev '^\s*#|^\s*$' /etc/ssh/sshd_config
