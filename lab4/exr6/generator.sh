#!/bin/bash

while true;
do
read LINE
case "$LINE" in
    TERM) 
        echo "GENERATOR STOP"
        kill -SIGTERM $(cat mypid)
        exit 1
        ;;
    *)
        :
        ;;
esac
done
	
