#!/bin/bash

if [[ ! -d "$HOME/source" ]] ;
then
	echo "$HOME/source directory does not exist"
	exit 1
fi

sourceDir="$HOME/source"
logFile="$HOME/backup-report"

currentDate=$(date +'%F')
currentDateSec=$(date -d "$currentDate" +'%s')

lastBackupName=$(ls "$HOME/" -l | grep -oE "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | tail -n1)
lastBackupDate=$(date -d $(echo "$lastBackupName" | grep -oE "[0-9]{4}-[0-9]{2}-[0-9]{2}") +'%s')
newFiles=""
renamedFiles=""

let difference=("$currentDateSec" - "$lastBackupDate")/86400

if [[ "$difference" -le 7 ]] ;
then
	backupFolderName="Backup-$currentDate"
	mkdir -p --verbose "$HOME/$backupFolderName" || echo "Can't create backup direction" || exit 2
	echo "Backup directory $HOME/$backupFolderName was created on $currentDate" >> "$logFile"
	for FILE in $(find "$sourceDir" -type f)
	do
		cp "$FILE" "$HOME/$backupFolderName" && echo $(basename "$FILE") >> "$logFile"
	done 
else
	backupFolderName="$HOME/$lastBackupName"
	echo "Backup directory $backupFolderName was changed on $currentDate" >> "$logFile"
	for FILE in $(find "$sourceDir" -type f)
	do
		baseFileName=$(basename "$FILE")
		if [[ ! -f "$backupFolderName/$baseFileName" ]];
		then
			cp "$FILE" "$backupFolderName"
            newFiles="${newFiles}\n${baseFileName}"
		else
			backupFileSize=$(wc -c "$backupFolderName/$baseFileName" | awk '{print $1}')
			fileSize=$(wc -c "$FILE" | awk '{print $1}')
            
			if [[ "$backupFileSize" -ne "$fileSize" ]];
			then
				mv "$backupFolderName/$baseFileName" "$backupFolderName/${baseFileName}.${currentDate}" && cp -p "$FILE" "$backupFolderName/$baseFileName" 
                renamedFiles="${renamedFiles}\n${baseFileName} ${baseFileNAme}.${currentDate}"
			fi
		fi
	done
	echo -e "New files:${newFiles}\nRenamed Files:${renamedFiles}" >> "$logFile"
fi
