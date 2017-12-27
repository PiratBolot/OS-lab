#!/bin/bash

ls -Rl "/var/log" 2> /dev/null | grep ^-  | sed '/^[\/|и|^$]/d;G' | awk '{ print $9 }' 
