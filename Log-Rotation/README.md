# Log Rotation Script
    This script is designed for system administrators at MyComp to manage log files for specified services by automating log rotation, compression, and cleanup tasks.
    It ensures optimal server performance and prevents disk space issues.

## Features
    - Log Rotation: Automatically rotates logs for services (e.g., httpd, sshd).
    - Compression: Compresses old logs to save disk space.
    - Retention Policy: Deletes logs older than a specified retention period (default: 30 days).
    - Automation: Can be scheduled via a cron job for periodic execution.
    - Notification: Sends an email notification once the log rotation is complete.


## Prerequisites
    1. Install sendmail for email notifications:
       - sudo apt install sendmail
       
    2. Ensure the script has execute permissions:
      - chmod +x log_rotation.sh

## How to Use
    1. Edit the Variables:
         - Set the log directory: LOG_DIR="/var/log"
         - Specify services: SERVICES=("httpd" "sshd")
         - Configure retention period: RETENTION_DAYS=30
         - Add your admin email: EMAIL="admin@mycomp.com"
    
    2. Run the Script:
        - ./log_rotation.sh
        
    3. Automate with Cron:
        - Edit the crontab file:
            crontab -e
        - Add a cron job to execute the script weekly:
            0 2 * * 0 /path/to/log_rotation.sh

## Example Output

    Starting log rotation...
    Rotating logs for services: httpd sshd
    Rotated /var/log/httpd.log
    Rotated /var/log/sshd.log
    Compressing old logs...
    Compression complete.
    Removing logs older than 30 days...
    Old logs removed.
    Notification sent to admin@mycomp.com.
    Log rotation process completed.

## Notes
    - Adjust the LOG_DIR and SERVICES to fit your server's configuration.
    - Logs older than 30 days are deleted by default. Update RETENTION_DAYS as needed.
    - Ensure the sendmail service is configured for email notifications.

