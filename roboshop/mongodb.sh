#!/bin/bash

ROOTUSER=$(su -i)

if [ $ROOTUSER -ne 0 ];
then
    echo "please run with sudo acess"
    exit 1;
else
    echo "your are sudo user moving further..!"
fi

dnf list installed nginx -y