#!/bin/bash

answer=""
while read LINE; do
	if [ "$LINE" == "q" ]; then
		break
	fi
	answer="$answer$LINE "
done
echo "$answer"

