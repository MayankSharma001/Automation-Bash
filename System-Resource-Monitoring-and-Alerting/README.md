# System Resource Monitoring and Alerting

## Task Description
As a system administrator at “MyComp,” ensuring optimal resource usage across your servers is critical
for maintaining performance and stability. To proactively monitor system resource usage (CPU, memory,
disk), you need to develop a script that continuously monitors these metrics. The script should send alerts
to notify you when resource usage exceeds predefined thresholds. This will help you identify potential
issues early and take appropriate actions to prevent system downtime or performance degradation.

## Requirements
1. Resource Monitoring:
  - Continuously monitor CPU usage, memory usage, and disk usage.
2. Threshold Definition:
  - Define thresholds for each resource (e.g., CPU ¿ 90%, memory ¿ 80%, disk ¿ 85%).
3. Alert Mechanism:
  - Send email alerts to notify the system administrator when any resource usage exceeds its threshold.
  - Include details such as the current resource usage level and timestamp in the alert.
4. Automation:
  - Automate the script to run at regular intervals (e.g., every 5 minutes).
  - Ensure reliability and efficiency in resource monitoring and alerting.


## Sample Email Alert

    Subject: [ALERT] CPU Usage on myserver

     Alert: High CPU usage detected
     Resource: CPU
     Usage: 92%
     Timestamp: 2025-05-04 20:30:02

## How It Works
1. CPU Usage:
  - Extracted from top command
  - Alerts if usage ≥ 90%

2. Memory Usage:
  - Extracted from free
  - Alerts if usage ≥ 80%

3. Disk Usage:
  - Extracted using df
  - Alerts if any mount point usage ≥ 85%

## Automation Using Cron
To run this script every 5 minutes:

1. Open the crontab:
   - crontab -e
2. Add the following line:
   - */5 * * * * /path/to/resource_monitor.sh
3. Ensure the script is executable:
   - chmod +x /path/to/resource_monitor.sh

## Permissions
Ensure the script has permission to read system stats and send email:
```
sudo chmod +x resource_monitor.sh
```
Use sudo with cron if needed for elevated access.


