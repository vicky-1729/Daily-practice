#!/bin/bash
ROOT=$(id -u )
#checking rootuser or not
if [ $ROOT -ne 0 ]
    then
        echo "please run with sudo user"
        exit 1;
    else
        echo "installing nginx ..!"
        dnf install nginx -y  
fi


