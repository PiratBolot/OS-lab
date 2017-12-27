#!/bin/bash
INPUT_DIR="/etc"
OUTPUT_FILE="$HOME/lab2/exr3/emails.lst"

grep -E -r -s -o "<[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]+>" "$INPUT_DIR" |  awk 'BEGIN { FS="<" } {print $2}' | awk 'BEGIN { FS=">"; ORS="," } {print $1}' > "$OUTPUT_FILE"
