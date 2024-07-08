#!/bin/bash

ID=$(id -u)
VALIDATE(){

   if [ $1 -ne 0 ]
 then
    echo "ERROR:: $2 is failed"
    exit 1
 else
    echo " Error:: $2 is SUCCESS"
fi

}

if [ $ID -ne 0 ]
 then echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

 VALIDATE $? "Installing Mysql"

yum install git -y

  VALIDATE $? "Installing Git"