echo "Script replace.bat will be start in 1 minute"
for /F %%a in ('time /t') do set timeT=%%a
schtasks /create /tr "C:\Lab6.2\replace.bat" /sc ONCE /st %timeT% /TN "Replace run" /RI 1
timeout /T 61
schtasks /delete /tn "Replace run" /F
