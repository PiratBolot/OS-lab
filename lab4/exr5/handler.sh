#!/bin/bash

result=1
operator='+'

(tail -n 0 -f "buffer.tmp") |
while true; 
do
read LINE
case "$LINE" in
	QUIT) 
		echo "Exiting with code 0"
		kill $(ps -a | grep tail | awk '{print $1}')
		exit
		;;
	+)
		operator='+'	        
		;;
	Multiply)
		operator='*'       		
		;;	
   	[0-9]*)
        if [[ "$operator" == '+' ]]
		then
		let "result=$result+$LINE"
		else
		let "result=$result*$LINE"
		fi
		echo "result=$result"
        ;;        
	*)	
		echo "Error. Exiting with code 1"
		killall tail
		exit 1
		;;
esac
done
