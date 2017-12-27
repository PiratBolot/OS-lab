#!/bin/bash

man bash | grep -i -o "[[:alpha:]]\{4,\}" | tr "[[:upper:]]" "[[:lower:]]" | sort | uniq -c | sort -n -r | head -3
