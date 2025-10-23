#!/bin/bash
R="\e[31m"
G="\e[32m"
B="\e[34m"
M="\e[35m"
N="\e[0m"
Log_Folder="/var/log/shellscript"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.logs"
mkdir -p $Log_Folder
echo "program start at : $(date)" &>>$Log_File
user=$(id -u)
if [ $user -ne 0 ]
then
   echo -e "$R Error please run this script with root access$N" &>>$Log_File
   exit 1
else
   echo -e  "$G you are running with the root access only$N" &>>$Log_File
fi

dnf install mysql -y  &>>$Log_File

if [ $? -ne 0 ]
then
   echo -e "$B Error : Mysql installation is failed$N" &>>$Log_File
   exit 1 
else
   echo -e  "$M done : Mysql installation is success$N" &>>$Log_File
fi
   