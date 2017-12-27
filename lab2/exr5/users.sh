#!/bin/bash

awk 'BEGIN { FS=":" } {print $3, $1}' /etc/passwd | sort -n -k1
