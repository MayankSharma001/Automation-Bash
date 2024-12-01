# Service Monitoring Script

## This lightweight script monitors a specified service, restarts it if stopped, and notifies the system administrator via email.

## Features
    - Checks if a service is running.
    - Restarts the service if not running.
    - Sends an email notification after a restart.

## Usage

### Save the script as `service_monitor.sh` and make it executable:

    -chmod +x service_monitor.sh

### Run the script with the service name as an argument:

    - ./service_monitor.sh <service_name>

## Automation

### To run the script at regular intervals, use a cron job:
    - crontab -e
### Add the following line to check the service every 5 minutes:
    - */5 * * * * /path/to/service_monitor.sh <service_name>


