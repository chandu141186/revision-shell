#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOG_FILE=/tmp/$0-$TIMESTAMP
echo "Script started executing at $TIMESTAMP" &>> $LOG_FILE


VALIDATE(){

   if [ $1 -ne 0 ]
 then
    echo -e "ERROR:: $2 is $R failed $N"
    exit 1
 else
    echo -e "  $2 is $G SUCCESS $N"
fi

}

if [ $ID -ne 0 ]
 then echo -e $R"ERROR:: Please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y &>>$LOG_FILE

 VALIDATE $? "Installing Mysql"

yum install git -y &>>$LOG_FILE

  VALIDATE $? "Installing Git"