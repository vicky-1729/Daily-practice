#!/bin/bash

#colors
r='\e[32m'
g='\e[33m'
w='\e[0m'
y='\e[34m'

#check root user or not
root_user=$(id -u)

if [ $root_user -ne 0 ]
then
    echo -e "$r please run with sudo user...! $w"
else
    echo -e "$g your a root user please continue $w"
fi



#creating log folder
LOGS_FOLDER="/var/log/roboshop-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SCRIPT_DIR=$PWD
mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

# checking output or validating
validation(){
    if [ $1 -eq 0 ]
    then
        echo -e "$2 is $g success..! $w"
    else
        echo "$2 is $r failure ...! $w"
}

dnf module disable nodejs -y
validation $? "disabling the node js module"

dnf module enable nodejs:20 -y
validation $? "enabling the nodejs:20 module"

dnf install nodejs -y
validation $? "nodejs installation"

useradd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop
validation $? "roboshop user creation"

mkdir -p /app 
validation $? "creating app directory ..for catalogue"


curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
validation $? "downloading catalogue code in temp folder"

cd /app 
unzip /tmp/catalogue.zip
validation $? "unzipping the catalogue files /app directory"

npm install 
validation $? "npm installation"