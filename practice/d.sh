#!/bin/bash

root_user=$(id -u)
packages=(nginx python java httpd)
LOGFILE="/tmp/package_install.log"

validation() {
    if [ $1 -eq 0 ]; then
        echo "$2 installed successfully"
    else
        echo "$2 not installed..!"
        exit 1
    fi
}

# Checking for root user
if [ ${root_user} -ne 0 ]; then
    echo "Please run as root or with sudo."
    exit 1
fi

for pkg in "${packages[@]}"; do
    dnf list installed "$pkg" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "$pkg is already installed."
    else
        echo "Installing $pkg..."
        dnf install "$pkg" -y | tee -a "$LOGFILE"
        validation $? "$pkg"
    fi
done
