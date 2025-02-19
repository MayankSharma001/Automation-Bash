#!/bin/bash

# Log file paths
LOG_FILE="/var/log/user_activity.log"
DAILY_REPORT="/var/log/user_daily_report.txt"
WEEKLY_REPORT="/var/log/user_weekly_report.txt"
ARCHIVE_DIR="/var/log/user_activity_archive"

#Ensure log directory exists
mkdir -p "$ARCHIVE_DIR"

#to record user login and logout times
log_user_activity() {
    last | awk '{print $1, $3, $4, $5, $6}' >> "$LOG_FILE"
}

#to generate daily report
generate_daily_report() {
    echo "Daily User Activity Report - $(date +'%Y-%m-%d')" > "$DAILY_REPORT"
    awk -v date="$(date +'%b %d')" '$2 ~ date {print $0}' "$LOG_FILE" >> "$DAILY_REPORT"
}

#to generate weekly report
generate_weekly_report() {
    echo "Weekly User Activity Report - Week of $(date +'%Y-%m-%d')" > "$WEEKLY_REPORT"
    awk '$2 ~ /Feb|Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec/ {print $0}' "$LOG_FILE" >> "$WEEKLY_REPORT"
}

#to archive old logs (older than 7 days) using tar for efficiency
archive_old_logs() {
    if [ -f "$LOG_FILE" ]; then
        tar -czf "$ARCHIVE_DIR/user_activity_$(date +'%Y-%m-%d').tar.gz" "$LOG_FILE" && > "$LOG_FILE"
    fi
}


main() {
    log_user_activity
    generate_daily_report
    generate_weekly_report
    archive_old_logs
}

main
