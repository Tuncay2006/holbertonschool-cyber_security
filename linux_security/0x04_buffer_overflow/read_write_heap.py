#!/usr/bin/python3
import sys
import os

if len(sys.argv) != 4:
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

pid = sys.argv[1]
search = sys.argv[2].encode()
replace = sys.argv[3].encode()

maps_path = f"/proc/{pid}/maps"
mem_path = f"/proc/{pid}/mem"

# maps fichier var mı?
if not os.path.exists(maps_path):
    print("Error: PID not found")
    sys.exit(1)

# heap bölgesini bul
heap_start = None
heap_end = None

try:
    with open(maps_path, "r") as f:
        for line in f:
            if "[heap]" in line:
                parts = line.split()
                addr = parts[0]
                heap_start, heap_end = [int(x, 16) for x in addr.split("-")]
                break
except:
    print("Error: Unable to read maps")
    sys.exit(1)

if heap_start is None:
    print("Error: heap not found")
    sys.exit(1)

# canlı heap'i tarayıp değiştir
try:
    with open(mem_path, "rb+") as mem:
        mem.seek(heap_start)
        heap = mem.read(heap_end - heap_start)

        pos = heap.find(search)
        if pos == -1:
            print("not found")
            sys.exit(0)

        # değiştir
        mem.seek(heap_start + pos)
        mem.write(replace)

        print(f"Replaced at: {hex(heap_start + pos)}")

except PermissionError:
    print("Error: Permission denied")
    sys.exit(1)
except Exception:
    print("Error: cannot access mem")
    sys.exit(1)
