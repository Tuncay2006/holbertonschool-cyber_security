lsb_release -i -s 2>/dev/null || grep -m1 '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"'
