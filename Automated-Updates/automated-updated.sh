#!/bin/bash
# This script checks for updates, installs them, and logs the results.

LOG_FILE="update_log.txt"
perform_updates() {
    echo "---------------------------------------------" >> "$LOG_FILE"
    echo "Update started at: $(date)" >> "$LOG_FILE"

    #Perform update and log output
    if yum -y update >> "$LOG_FILE" 2>&1; then
        echo "Update completed successfully." >> "$LOG_FILE"
    else
        echo "Update encountered errors. Check above logs for details." >> "$LOG_FILE"
    fi

    echo "Update ended at: $(date)" >> "$LOG_FILE"
    echo "---------------------------------------------" >> "$LOG_FILE"
}

perform_updates
