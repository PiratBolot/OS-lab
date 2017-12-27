#!/bin/bash

x=$(pwd)
if [ "$x" == "$HOME" ]; then
	echo "$x"
	exit 0
else
	echo "Error"
	exit 1
fi
