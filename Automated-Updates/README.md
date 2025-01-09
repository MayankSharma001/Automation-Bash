# Automated Updates Script

## Project Description
    - This script helps system administrators automatically update servers with the latest security patches and software updates. It checks for updates, installs them, and logs all details for easy tracking.
    - The script works with yum or dnf, depending on the Linux distribution.

### Features
    - Automatically checks for and installs updates using yum or dnf.
    - Logs update details, including:
      - Date and time of the update.
      - List of updated packages.
      - Errors encountered during the process.
    - Can be scheduled to run automatically at regular intervals using cron jobs.

### Setup Guide
    1. Grant Execute Permission
    - chmod +x automated_updates.sh
    
    2. Run the Script
    - ./automated_updates.sh
    
    3. Schedule with Cron
      Open the cron editor:
        - crontab -e
      Add a line to run the script daily (e.g., at midnight):
        - 0 0 * * * /path/to/automated_updates.sh
    
    4. Save and exit.
