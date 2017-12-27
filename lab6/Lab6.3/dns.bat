net stop dnscache
sc config dnscache start=disabled
timeout /T 5
net start > temp.txt
start diff.bat
sc config dnscache start=auto
net start dnscache
