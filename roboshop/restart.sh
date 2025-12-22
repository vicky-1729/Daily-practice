#!/bin/bash
#You are asked to monitor multiple services like `nginx`, `sshd`, and `docker`.  

# **Task:**  

# - Write a shell script that checks the status of each service.
# - If a service is stopped, attempt to restart it.
# - Print a clearly formatted report.

#list of services

services=(nginx sshd docker)

echo "Service Status Report"
echo "====================="

for service in "${services[@]}"
do
    if systemctl is-active --quiet "$service" 2>/dev/null; then
        echo "$service: Running"
    else
        echo "$service: Stopped - Attempting to restart..."
        if systemctl start "$service" 2>/dev/null; then
            echo "$service: Successfully restarted"
        else
            echo "$service: Failed to restart"
        fi
    fi
done

