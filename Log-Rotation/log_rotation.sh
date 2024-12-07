#!/bin/bash

# Script for log rotation, compression, retention, and notification with functions for each individual component 

# Variables
LOG_DIR="/var/log"
SERVICES=("httpd" "sshd")       # List of services
RETENTION_DAYS=30              # Retention period
EMAIL="admin@mycomp.com"       # Admin email for notifications

rotate_logs()
{
    echo "Rotating logs for services: ${SERVICES[*]}"
    for SERVICE in "${SERVICES[@]}"; do
        LOG_FILE="$LOG_DIR/$SERVICE.log"
        if [ -f "$LOG_FILE" ]; then
            mv "$LOG_FILE" "$LOG_FILE.$(date +%Y%m%d)"
            echo "Rotated $LOG_FILE"
        else
            echo "No log file found for $SERVICE"
        fi
    done
}

compress_logs()
{
    echo "Compressing old logs..."
    find "$LOG_DIR" -name "*.log.*" -exec gzip {} \;
    echo "Compression complete."
}

remove_old_logs()
{
    echo "Removing logs older than $RETENTION_DAYS days..."
    find "$LOG_DIR" -name "*.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;
    echo "Old logs removed."
}

send_notification()
{
    echo -e "Subject: Log Rotation Complete\n\nLog rotation and cleanup have been successfully completed." | sendmail "$EMAIL"
    echo "Notification sent to $EMAIL."
}

# Main function to call all the defined functions
main()
{
    echo "Starting log rotation..."
    rotate_logs
    compress_logs
    remove_old_logs
    send_notification
    echo "Log rotation process completed."
}

main
