#!/bin/bash

for i in $(ls /proc/ | grep "^[0-9]")
do
readlink /proc/"$i"/exe | grep "/sbin" | echo "$i" >> answer.tmp
done
