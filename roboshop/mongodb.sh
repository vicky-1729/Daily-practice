#!/bin/bash

ROOTUSER=$(id -u)
# adding colors for best view

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#checking the root user
if [ $ROOTUSER -ne 0 ];
    then
        echo -e "$R please run with sudo acess $N"
        exit 1;
    else
        echo -e "$G your are sudo user moving further..! $N "
fi

VALIDATE(){
 if [ $1 eq 0 ]
    then
    echo -e " $2 is $G successfully $N"
    else
    echo -e " $2 is $R failed $N"
}


cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "copying the mongo repo to /etc/yum.repos.d/mongo.repo"