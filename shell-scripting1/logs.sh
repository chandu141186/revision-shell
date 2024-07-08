#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOG_FILE=/tmp/$0-$TIMESTAMP
R="\e[31m"
G="\e(32m"
N="\e[0m"

VALIDATE(){

   if [ $1 -ne 0 ]
 then
    echo "ERROR:: $2 is $R failed $N"
    exit 1
 else
    echo "  $2 is $G SUCCESS $N"
fi

}

if [ $ID -ne 0 ]
 then echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y &>>$LOG_FILE

 VALIDATE $? "Installing Mysql"

yum install git -y &>>$LOG_FILE

  VALIDATE $? "Installing Git"