#!/bin/bash
file="$1"

echo "What app do you want to run? Enter the number"
echo "1) nano"
echo "2) vi"
echo "3) links"
echo "4) exit"
read case
case "$case" in
	1) /bin/nano "$file"
	;;
	2) /usr/bin/vi "$file"
	;;
	3) /usr/bin/links
	;;
	4) exit 0
	;;
	*)
	echo "Invalid action" 
esac

