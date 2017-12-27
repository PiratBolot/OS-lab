#!/bin/bash


ps -U pirat_bolot | sed '/PID/d' | wc -l > answer.tmp
ps -U pirat_bolot | sed '/PID/d' | awk '{print $1, ":", $4}' >> answer.tmp
