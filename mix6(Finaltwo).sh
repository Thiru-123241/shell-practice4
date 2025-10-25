#!/bin/bash

R="\e[31m"
G="\e[32m"
B="\e[34m"
M="\e[35m"
N="\e[0m"
Y="\e[33m"
C="\e[36m"
Log_Folder="/var/log/twentyfive"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.log"
Time=$(date)
mkdir -p $Log_Folder
echo "program starts at : $Time" | tee -a $Log_File


user=$(id -u)
if [ $user -eq 0 ]
then
   echo -e  "$R you are running with the root access only $N" | tee -a $Log_File
else 
   echo -e  "$G Error:we need sudo access to run this script $N" | tee -a $Log_File
   exit 1
fi

dnf list installed mysql  &>>$Log_File

if [ $? -ne 0 ]
then
   echo -e "$B now we are ready to install mysql $N" | tee -a $Log_File
   dnf install mysql -y  &>>$Log_File

if [ $? -ne 0 ]
then
   echo -e "$M error : mysql package  installation is failure $N" | tee -a $Log_File
   exit 1
else
   echo -e "$Y mysql package  installation is success $N" | tee -a $Log_File
fi
else
   echo -e  "$C mysql package is already installed.......nothing to do now $N"  | tee -a $Log_File
   exit
fi