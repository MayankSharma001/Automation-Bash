#!/bin/bash

# Specify the service to monitor
SERVICE=$1
ADMIN_EMAIL="admin@mycomp.com"

if [ -z "$SERVICE" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi


if ! systemctl is-active --quiet "$SERVICE"; then
    
    systemctl start "$SERVICE"
    
    if systemctl is-active --quiet "$SERVICE"; then
    
        echo "Subject: Service Alert - $SERVICE restarted" | sendmail "$ADMIN_EMAIL"
    fi
fi
