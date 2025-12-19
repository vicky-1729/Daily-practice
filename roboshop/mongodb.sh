#!/bin/bash

USERID=$(id -u)

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/roboshop-logs"
SCRIPT_NAME=$(basename "$0" | cut -d "." -f1)
LOGFILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script execution started at: $(date)" | tee -a $LOGFILE

# Root check
if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with sudo access $N"
    exit 1
else
    echo -e "$G You are a sudo user, moving further... $N"
fi

VALIDATE() {
    if [ $1 -eq 0 ]; then
        echo -e "$2 is $G SUCCESS $N"
    else
        echo -e "$2 is $R FAILED $N"
        exit 1
    fi
}

cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $LOGFILE
VALIDATE $? "Copying MongoDB repo file"

dnf install mongodb-org -y &>> $LOGFILE
VALIDATE $? "MongoDB installation"

systemctl enable mongod &>> $LOGFILE
VALIDATE $? "Enabling mongod"

systemctl start mongod &>> $LOGFILE
VALIDATE $? "Starting mongod"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>> $LOGFILE
VALIDATE $? "MongoDB configuration update (bind IP)"

systemctl restart mongod &>> $LOGFILE
VALIDATE $? "Restarting mongod"

echo -e "$G MongoDB setup completed successfully $N"
