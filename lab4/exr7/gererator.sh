#!/bin/bash

while true;
do
read LINE
case "$LINE" in
    TERM)
        kill -SIGTERM $(cat .kill)
        exit
        ;;
    +)
        kill -USR1 $(cat .plus)
        ;;
    [*])
        kill -USR2 $(cat .mul)
        ;;
	*)
	:
	;;		
esac
done
