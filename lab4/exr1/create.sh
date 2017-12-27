#!/bin/bash

DATA=$(date '+%d.%m.%Y_%H:%M:%S')
mkdir "$HOME/test" 2> "/dev/null" && echo -e "Catalog test was created successfully\n" > "$HOME/report" && touch "$HOME/test/$DATA.tmp"
ping -c5 "www.net_nikogo.ru" 2>>"$HOME/report" 
