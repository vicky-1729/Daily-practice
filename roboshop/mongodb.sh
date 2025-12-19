#!/bin/bash

USERID=$(id -u)

# Colors
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# Logs
LOGS_FOLDER="/var/log/roboshop-logs"
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p "$LOGS_FOLDER"
echo "Script started executing at: $(date)" | tee -a "$LOG_FILE"

# Root user check
if [ "$USERID" -ne 0 ]; then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a "$LOG_FILE"
    exit 1
else
    echo -e "$G You are running with root access $N" | tee -a "$LOG_FILE"
fi

# Validation function
VALIDATE() {
    if [ "$1" -eq 0 ]; then
        echo -e "$2 ... $G SUCCESS $N" | tee -a "$LOG_FILE"
    else
        echo -e "$2 ... $R FAILURE $N" | tee -a "$LOG_FILE"
        exit 1
    fi
}

# Copy MongoDB repo
cp mongo.repo /etc/yum.repos.d/mongodb.repo &>>"$LOG_FILE"
VALIDATE $? "Copying MongoDB repo"

# Install MongoDB
dnf install mongodb-org -y &>>"$LOG_FILE"
VALIDATE $? "Installing MongoDB server"

# Enable MongoDB
systemctl enable mongod &>>"$LOG_FILE"
VALIDATE $? "Enabling MongoDB"

# Start MongoDB
systemctl start mongod &>>"$LOG_FILE"
VALIDATE $? "Starting MongoDB"

# Allow remote connections
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>"$LOG_FILE"
VALIDATE $? "Configuring MongoDB for remote connections"

# Restart MongoDB
systemctl restart mongod &>>"$LOG_FILE"
VALIDATE $? "Restarting MongoDB"

echo -e "$Y MongoDB setup completed successfully $N" | tee -a "$LOG_FILE"
