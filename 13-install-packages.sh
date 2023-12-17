#!/bin/bash
ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script execution started at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e $2 ...$R FAILED $N"
    else
        echo -e $2 ...$G SUCCESS $N"
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

echo "All Arguments passed :: $@"

for package in $@
do
    yum list installed $package  &>> $LOGFILE # checking installed or not
    if [ $? -ne 0 ] # if not installed 
    then
        yum install $package -y &>> $LOGFILE
        VALIDATE $?  "Installation of $package"
    else
        echo -e "$package is alredy installed.. $Y SKIPPING $N"
done