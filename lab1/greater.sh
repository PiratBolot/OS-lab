#!/bin/bash
great=0
if [ "$1" -lt "$2" ]; then
	let great="$2"
else
	let great="$1"
fi
if [ "$great" -lt "$3" ]; then
	echo "$3"
else
	echo "$great"
fi
