# File Permissions Audit

## Overview

As a system administrator at MyComp, ensuring the security and integrity of critical system files and directories is crucial. Unauthorized changes to file permissions can lead to security risks.
This script audits the file permissions of critical system files and directories, compares them against expected permissions, and generates a report highlighting any deviations.
By running this script, you can quickly identify any unauthorized changes and take necessary action.

## Features

   - Specify Critical Files and Directories: Define the important files and directories that need auditing.
   - Expected Permissions: Set the expected permissions for these files and directories.
   - Audit Permissions: Compare current permissions with the expected ones.
   - Generate Report: List any deviations in a structured format.
   - Readable Output: Display results in a clear and simple way.
   - Automation (Optional): Schedule the script to run daily or weekly using a cron job.

## How It Works

   1. The script contains a list of critical files and directories.
   2. It stores their expected permissions.
   3. It fetches the current permissions of these files.
   4. It compares the current permissions with the expected ones.
   5. If there are any mismatches, it reports them.
   6. The output is saved in a log file for easy review.

## How to Use

    1. Copy the script to a file, e.g., permission_audit.sh
    2. Give it execute permissions:
         - chmod +x permission_audit.sh
    3. Run the script manually:
         - ./permission_audit.sh
    4. (Optional) Set up a cron job to run it automatically:
         - crontab -e
     - Add the following line to run it daily at midnight:
         - 0 0 * * * /path/to/permission_audit.sh
  
## Output Example
    File Permissions Audit - Mon Jan 29 12:00:00 UTC 2025
    ------------------------------------
    WARNING: Permission mismatch for /etc/shadow
    Expected: ----------, Found: -rw-r-----
    ERROR: /etc/hosts not found!
    Audit completed. Check /var/log/permission_audit.log for details.

## Notes

 - Modify the FILES dictionary to add more files as needed.
 - Ensure the script has permission to read system files.
 - Use sudo if required to run the script with elevated privileges.
 - Store logs in a secure location.
