#!/bin/bash

grep -E -o -h -s "^#!\s*/\S+$" /bin/* | sed -E "s/^#!\s*(\/\S+)$/\1/" | sort | uniq -c | sort -r -n | head -1
