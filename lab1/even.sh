#!/bin/bash
count=0
read Num

while [[ $((Num % 2)) -eq 1 ]]; do
	((count++))
	read Num
done
echo "$count"
