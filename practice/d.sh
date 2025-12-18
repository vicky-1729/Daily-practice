#!/bin/bash
ROOT=$(id -u )
#checking rootuser or not
if [ $ROOT -ne 0 ]
then
    echo "please run with sudo user"
else
    echo "installing ngin ..!"
    dnf install nginx -y  
fi


