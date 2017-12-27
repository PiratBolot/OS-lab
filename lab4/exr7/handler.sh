#!/bin/bash

echo "$$" > .kill
echo "$$" > .plus
echo "$$" > .mul
i=1
mode="+"
sigterm()
{
    echo "STOP. Terminator signal has received"
    exit
}
user1()
{
    mode="+"
}
user2()
{
    mode="*"
}
trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2
while true;
do
    case "$mode" in
        +)
            let "i=$i+2"
            ;;
        [*])
            let "i=$i*2"
            ;;
    esac
    echo "$i"
    sleep 1
done

