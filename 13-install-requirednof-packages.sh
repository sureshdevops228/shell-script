#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script execution start at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
        echo -e "$2 ... $R FAILED $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root user $N"
    exit 1
else
    echo -e "$G You are root user $N"
fi

#echo "All Arguments are passed :: $@"
# git , postfic , net-tools

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then 
        yum install $package -y &>> $LOGFILE
        VALIDATE $? "Installation of $package"
    else
        echo -e "$Y $Package is alredy installed $N" &>> $LOGFILE
done

