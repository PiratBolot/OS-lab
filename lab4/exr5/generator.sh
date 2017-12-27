#!/bin/bash

exec > "buffer.tmp"
while true; 
do
read LINE
if [ "$LINE" == "*" ]
then
echo "Multiply"
else
echo "$LINE"
fi
if [ "$LINE" == "QUIT" ]
then
exit
fi
done
