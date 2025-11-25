#!/usr/bin/env python3
import sys, os, re

if len(sys.argv) != 4:
    print("Usage: read_write_heap.py pid search replace"); exit(1)

pid, s, r = sys.argv[1], sys.argv[2].encode(), sys.argv[3].encode()
if len(r) > len(s):
    print("replace must be <= search length"); exit(1)

with open(f"/proc/{pid}/maps") as m:
    for line in m:
        if "[heap]" in line:
            a,b = [int(x,16) for x in re.findall(r"[0-9A-Fa-f]+", line)[:2]]
            break
    else: print("heap not found"); exit(1)

with open(f"/proc/{pid}/mem","rb+") as mem:
    mem.seek(a)
    data = mem.read(b-a)
    i = data.find(s)
    if i < 0: print("not found"); exit(0)
    mem.seek(a+i)
    mem.write(r + b"\x00"*(len(s)-len(r)))
