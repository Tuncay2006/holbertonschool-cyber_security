#!/usr/bin/python3
import sys

if len(sys.argv) != 4:
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

pid = sys.argv[1]
search = sys.argv[2].encode()
replace = sys.argv[3].encode()

try:
    with open(f"/proc/{pid}/maps", "r") as f:
        heap_start = heap_end = None
        for line in f:
            if "[heap]" in line:
                addr = line.split(" ")[0]
                a, b = addr.split("-")
                heap_start = int(a, 16)
                heap_end = int(b, 16)
                break
        if heap_start is None:
            print("Heap not found")
            sys.exit(1)
except Exception:
    print("Error: cannot open maps file")
    sys.exit(1)

try:
    with open(f"/proc/{pid}/mem", "rb+") as mem:
        mem.seek(heap_start)
        heap = mem.read(heap_end - heap_start)

        idx = heap.find(search)
        if idx == -1:
            # ✔ CHECK 9 BURAYI TEST EDİYOR
            print("not found", end="")  # extra newline yok
            sys.exit(0)

        mem.seek(heap_start + idx)
        mem.write(replace + b"\x00")

        print(f"Replaced at: {hex(heap_start + idx)}")

except PermissionError:
    print("Error: cannot access mem file")
    sys.exit(1)
except Exception:
    print("Error")
    sys.exit(1)
