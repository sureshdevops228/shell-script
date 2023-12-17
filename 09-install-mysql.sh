#!/bin/bash

ID=$(id -u) # it will check you are root user or not.

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end


yum install mysql -y


if [ $? -ne 0 ] #$? is special variable if success it has "0", Failue its has not zero.
then
    echo "ERROR:: Installing MySQL is failed"
    exit 1 #if we got the error we stop the program here and comeout 
else
    echo "Installing MySQL is SUCCESS"
fi  

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing git is failed"
    exit 1
else
    echo "Installing git is SUCCESS"
fi


