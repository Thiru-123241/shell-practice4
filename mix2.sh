#!/bin/bash

R="\e[31m"
G="\e[32m"
B="\e[34m"
M="\e[35m"
N="\e[0m"
Y="\e[33m"
C="\e[36m"
Log_Folder="/var/log/shellscript"
Script_name=$(echo $0 | cut -d "." -f1)
Log_File="Log_Folder/Script_name.log"
Time=$(date)
mkdir -p $Log_Folder
echo "program starts at : $Time"


user=$(id -u)
if [ $user -eq 0 ]
then
   echo -e  "$R you are running with the root access only $N"
else 
   echo -e  "$G Error:we need sudo access to run this script $N"
   exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
   echo -e "$B now we are ready to install mysql $N"
   dnf install mysql -y

if [ $? -ne 0 ]
then
   echo -e "$M error : mysql package  installation is failure $N"
   exit 1
else
   echo -e "$Y mysql package  installation is success $N"
fi
else
   echo -e  "$C mysql package is already installed.......nothing to do now $N"
   exit
fi


#This below one denotes mongodb installation

# dnf list installed mongodb-org

# if [ $? -ne 0 ]
# then
#    echo "now we are ready to install mongodb"
#    dnf install mongodb-org -y 

# if [ $? -ne 0 ]
# then
#    echo " error : mongodb package  installation is failure"
#    exit 1
# else
#    echo "mongodb package  installation is success"
# fi
# else
#    echo "mongodb package is already installed.......nothing to do now"
#    exit
# fi



#This below one denotes nginx installation

# dnf list installed nginx

# if [ $? -ne 0 ]
# then
#    echo "now we are ready to install nginx"
#    dnf install nginx -y

# if [ $? -ne 0 ]
# then
#    echo " error : nginx package  installation is failure"
#    exit 1
# else
#    echo "nginx package  installation is success"
# fi
# else
#    echo "nginx package is already installed.......nothing to do now"
#    exit
# fi