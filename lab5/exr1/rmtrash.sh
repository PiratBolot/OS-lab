#!/bin/bash

if [[ "$#" -ne 1 ]] ; 
then
	echo "Script has incorrect number of arguments at the input: $#"
	exit 1
fi

if [[ ! -f "$1" ]];
then
    echo "File $1 does not exist"
    exit 2
fi

deletedFile="$1"
trashPath="$HOME/.trash"
trashLogPath="$HOME/.trash.log"
IDFile="${trashPath}/.idFile"

if [[ ! -d "$trashPath" ]] 
then
    mkdir -p "$trashPath" 
    echo "0" > "$IDFile"
fi

let referenceName="$(cat $IDFile)"+1
echo "$referenceName" > "$IDFile"

ln "./$deletedFile" "${trashPath}/${referenceName}"

echo "${PWD}/${deletedFile}:${referenceName}" >> "$trashLogPath"

# -f - ignore nonexistent files 
rm -f "./$deletedFile"
