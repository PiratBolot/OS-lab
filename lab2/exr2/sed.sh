#!/bin/bash
INPUT_FILE="/var/log/Xorg.0.log"
OUTPUT_FILE="$HOME/lab2/exr2/full.log"

grep "] (WW)" "$INPUT_FILE" | sed -e "/(WW)/s/(WW)/Warning:/" > "$OUTPUT_FILE"
grep "] (II)" "$INPUT_FILE" | sed -e "/(II)/s/(II)/Information:/" >> "$OUTPUT_FILE"
