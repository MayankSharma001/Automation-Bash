# Task 2
## Task Description
As a system administrator at ”MyComp,” you are responsible for monitoring and maintaining the health
of the company’s servers. To ensure that disk usage does not exceed critical levels and to keep an eye on
storage consumption trends, you need to generate regular disk usage reports. The reports should cover
all mounted filesystems and be emailed to you daily.
• Generate Disk Usage Report:
– The script should collect disk usage information for all mounted filesystems.
– The report should include details such as filesystem name, total size, used space, available
space, and usage percentage.
• Email the Report:
– The report should be emailed to the system administrator (e.g., admin@mycomp.com) every
day.
– The email should have a clear subject line and body, making it easy to identify and read the
report.
• Automate the Process:
– The script should be set up to run daily using a cron job.

### --------------------------------------------------------------------------------------------------------------------------------

# Features

### Disk Usage Report Generation:
    -- Collects disk usage information for all mounted filesystems.
    -- Displays details such as:
    -- Filesystem name
    -- Total size
    -- Used space
    -- Available space
    -- Usage percentage
  
### Email Notification:
    -- Sends the report to the administrator's email daily.
    -- Includes a clear subject line for easy identification.
    
### Automation:
    -- Configurable for daily execution via a cron job.

### --------------------------------------------------------------------------------------------------------------------------------

# Explanation of the Script

## Email Address:
The EMAIL variable specifies the recipient's email address (e.g., admin@mycomp.com).

## Subject Line:
The SUBJECT variable adds a dynamic subject line to the email with the current date for easy tracking.

## Disk Usage Report:
The df -h command collects a human-readable overview of disk usage across all mounted filesystems.

## Send Email:
The mail command sends the generated report as the email body.

### --------------------------------------------------------------------------------------------------------------------------------

# Setup Instructions

## 1. Prerequisites
Ensure the following tools are installed on your system:

### mailutils: Used for sending emails.

sudo apt-get install mailutils  # For Debian/Ubuntu

sudo yum install mailx          # For CentOS/RHEL

### permissions: Ensure the script has execute permissions:
chmod +x disk_usage_report_simple.sh

## 2. Automating with Cron
To ensure the script runs daily, set up a cron job:

### Edit the crontab file:

crontab -e

Add the following line to schedule the script daily at 8:00 AM:

0 8 * * * /path/to/disk_usage_report_simple.sh

Save and exit.
