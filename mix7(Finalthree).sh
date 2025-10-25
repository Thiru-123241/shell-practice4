#!/bin/bash
R="\e[31m"
G="\e[32m"
B="\e[34m"
M="\e[35m"
N="\e[0m"
Y="\e[33m"
C="\e[36m"
Log_Folder="/var/log/oct"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="$Log_Folder/$Script_name.log"
Time=$(date)
mkdir -p $Log_Folder
echo "program starts at : $Time" &>>$Log_File
user=$(id -u)
if [ $user -eq 0 ]
then
   echo -e "$R you are running with the root access only $N" | tee -a $Log_File
else 
   echo -e "$G Error:we need sudo access to run this script $N"  | tee -a $Log_File
   exit 1
fi
VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$B error : $2 package  installation is failure $N" | tee -a $Log_File
       exit 1
    else
        echo -e "$M $2 package  installation is success $N" | tee -a $Log_File
    fi
}
dnf list installed mysql &>>$Log_File
if [ $? -ne 0 ]
then
   echo -e "$Y now we are ready to install mysql $N" | tee -a $Log_File
   dnf install mysql -y &>>$Log_File
  VALIDATE $?  MYSQL
else
   echo -e "$C mysql package is already installed.......nothing to do now $N" | tee -a $Log_File
fi
#This below one denotes mongodb installation
dnf list installed mongodb-org  &>>$Log_File
if [ $? -ne 0 ]
then
   echo -e "$R now we are ready to install mongodb $N" | tee -a $Log_File
   dnf install mongodb-org -y  &>>$Log_File
   VALIDATE $? MONGODB
else
   echo -e "$G mongodb package is already installed.......nothing to do now $N" | tee -a $Log_File
fi
#This below one denotes nginx installation

dnf list installed nginx &>>$Log_File
if [ $? -ne 0 ]
then
   echo -e  "$B now we are ready to install nginx $N" | tee -a $Log_File
   dnf install nginx -y &>>$Log_File
   VALIDATE $? nginx
else
   echo -e 
    "$M nginx package is already installed.......nothing to do now $N" | tee -a $Log_File
fi