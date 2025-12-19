#!/bin/bash

ROOTUSER=$(id -u)
# adding colors for best view

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/roboshop-logs"
FILENAME=$(echo $0 | cut -d "." -f1)
LOGFILE="$LOGS_FOLDER/$FILENAME.log"

mkdir -p $LOGS_FOLDER
echo "script was executing at :$(date)" | tee -a $LOGFILE
#checking the root user
if [ $ROOTUSER -ne 0 ];
    then
        echo -e "$R please run with sudo acess $N"
        exit 1;
    else
        echo -e "$G your are sudo user moving further..! $N "
fi

VALIDATE(){
 if [ $1 -eq 0 ]
    then
    echo -e " $2 is $G success $N"
    else
    echo -e " $2 is $R failed $N"
fi
}


cp mongo.repo /etc/yum.repos.d/mongo.repo
VALIDATE $? "copying the mongo repo to /etc/yum.repos.d/mongo.repo"

dnf install mongodb-org -y &>> $LOGFILE
VALIDATE $? "mongodb installation"

systemctl enable mongod
VALIDATE $? "enabling mongod"

systemctl start mongod
VALIDATE $? "started mongod"

sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf
VALIDATE $? "mongodb confugiration set 127.0.0.1 --> 0.0.0.0"

systemctl restart mongod 
VALIDATE $? "restarted mongod"