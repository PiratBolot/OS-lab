#!/bin/bash 

function creation {
    if [[ -f "$1/$fileBaseName" ]] ;
	then
		    echo "There is file with the same name."
			read -p "Do you want to rename restorable file? (y/n) " -n 1 -r
            echo
			if [[ "$REPLY" =~ ^[Yy]$ ]] ;
			then                
				read -p "New file name: " newName
                while [ $newName == $fileBaseName ]
                do
                    echo "The new file name is equal to previous one. Please try again "
                    read -p "New file name: " newName
                done   
				ln "$trashPath/$trashName" "$1/$newName"
			else
				echo "In this case, new file name will be generated automatically"
				ln "$trashPath/$trashName" "$1/${trashName}${fileBaseName}"			
			fi			
	else
            ln "$trashPath/$trashName" "$1/$fileBaseName"
	fi    
    rm "$trashPath/$trashName"
    echo "File was restored"
}

if [[ "$#" -ne 1 ]];
then
	echo "Script has incorrect number of arguments at the input: $#"
	exit 1
fi

trashLogPath="$HOME/.trash.log"
trashPath="$HOME/.trash"

if [[ ! -d "$trashPath" ]];
then
	echo "Trash folder does not exist"
	exit 2
fi

if [[ ! -f "$trashLogPath" ]];
then
	echo "Trash log file does not exist"
	exit 3
fi

for LINE in $(grep -h "^/[^\0]*$1:[0-9]*$" "$trashLogPath")
do
	filePath=$(echo "$LINE" | awk -F ":" '{print $1}') 
    echo "$filePath"   
    echo "$fileBaseName"
    echo "$filePath2"
	read -p "Do you want to restore the file: $filePath?(y/n) " -n 1 -r
	echo
	if [[ ! "$REPLY" =~ ^[Yy]$ ]];
	then 
		echo "You refused to restore the file"
		continue
	fi

	if [[ ! -f "${trashPath}/${trashName}" ]] ;
	then
		echo "Something terrible has happened. Hard link does not exist"
		continue
	fi

	if [[ -d  "$filePath2" ]] ;
	then
		creation "$filePath2"
	else
		echo "The destination directory does not exist"
		echo "The file will be restored to the HOME directory"
		creation "$HOME"
	fi 
	
done
