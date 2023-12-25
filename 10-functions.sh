#1/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0]
    then
    echo "ERROR:: $2 .. FAILED"
    exit 1
    else
    echo "$2 SUCCESS"
    fi
}

if[ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
elase
     echo "Your are root user"

yum install mysql -y

VALIDATE $? "Installing MYSQL"  # for the function we are giving Inputs

yum install git -y

VALIDATE $? "Installing GIT"