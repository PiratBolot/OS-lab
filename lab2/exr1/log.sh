#!/bin/bash
OUTPUT_FILE="$HOME/lab2/exr1/errors.log"
grep -rsh "^update" "/var/log" > "$OUTPUT_FILE"
grep -E -e "/[-_A-Za-z0-9]+(/[-_A-Za-z0-9]*)*" "$OUTPUT_FILE" 
 






