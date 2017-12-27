#!/bin/bash

result=""
for process in $(ps -A -o pid | tail -n +2)
do
status="/proc/$process/status"
sched="/proc/$process/sched"
ppid=$(grep -hsi "PPid:" "$status" | awk 'BEGIN{FS="\t"}{print $2}')
sleepavg=$(grep -hsi "clock-delta" "$sched" | grep -o "[0-9.]\+")
if [[ -z "$sleepavg" ]]
then sleepavg=0
fi
if [[ "$ppid" != "" ]]
then result="$result""ProcessID=$process : Parent_ProcessID=$ppid : Average_Sleeping_Time=$sleepavg"$'\n'
fi
done
echo "$result" | sort -t "=" -g -k3 > answer.tmp

