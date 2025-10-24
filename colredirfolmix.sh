#!/bin/bash

Num=$1
R="\e[31m"
G="\e[32m"
N="\e[0m"
Log_Folder="/var/log/shellscript"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.log"


mkdir -p $Log_Folder
echo "program starts at : $(date)" &>> $Log_File
if [ $Num -gt 100 ]
then
   echo -e "$R $Num is greater than 100.........$N" &>> $Log_File
else
   echo -e "$G $Num is lessthan than 100........$N" &>> $Log_File
fi  
      