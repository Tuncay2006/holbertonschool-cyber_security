#!/bin/bash
lsb_release -i | tr -d '[:space:]' | cut -d: -f2
