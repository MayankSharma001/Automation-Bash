# User Account Management Automation

# Task Description
As a system administrator at “MyComp,” you are responsible for managing user accounts on the system.
To streamline administrative tasks and ensure security compliance, you need to develop a script that
automatically generates reports on user accounts. These reports should include details such as the last
login time, password expiration status, and account status (active or inactive).

## Requirements
1. User Account Details:
  - Retrieve and display user account details, including username, last login time, password expiration,
and account status.
2. Password Expiration:
  - Check and report if a user’s password is set to expire soon.
3. Account Status:
  - Determine if user accounts are active or inactive.
4. Automated Report Generation:
  - Automatically generate reports on user accounts at scheduled intervals (e.g., daily, weekly).
5. User-Friendly Output:
  - Present the reports in a clear and readable format for administrative review.

## Prerequisites
1. A Linux system with Bash
2. Root or sudo privileges
3. chage and passwd utilities available
4. mail command configured for sending emails

## Installation & Setup
1. Copy the script to a suitable location, e.g., /usr/local/bin/user_account_report.sh
2. Give it execute permissions:
   - chmod +x /usr/local/bin/user_account_report.sh
3. Configure mail settings to ensure email delivery (e.g., install and configure mailx).
4. Schedule the script to run weekly using cron:
   sudo crontab -e
   0 2 * * 0 /usr/local/bin/user_account_report.sh

## How It Works
1. The script extracts all system users from /etc/passwd.
2. It retrieves password expiration details using chage.
3. If a password is set to expire within 7 days, it is marked as “Expiring Soon.”
4. The script checks whether the account is active or locked.
5. The collected data is formatted into a report and saved to /var/log/user_account_report.txt.
6. The report is emailed to the administrator.

## Troubleshooting
1. Ensure the script is executed with root privileges.
2. Check if mail is properly configured.
3. Verify cron job scheduling using:
   crontab -l
4. If no report is generated, check /var/log/user_account_report.txt for errors.
