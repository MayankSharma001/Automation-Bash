#!/bin/bash

REPORT_FILE="/tmp/system_report.txt"

UPTIME=$(uptime -p)

LOGGED_IN_USERS=$(who | wc -l)

USER_LIST=$(who | awk '{print $1}' | sort | uniq)

# the report
echo "System Report - $(date)" > "$REPORT_FILE"
echo "----------------------------------" >> "$REPORT_FILE"
echo "Uptime: $UPTIME" >> "$REPORT_FILE"
echo "Number of logged-in users: $LOGGED_IN_USERS" >> "$REPORT_FILE"
echo "Logged-in users:" >> "$REPORT_FILE"
echo "$USER_LIST" >> "$REPORT_FILE"
echo "----------------------------------" >> "$REPORT_FILE"

cat "$REPORT_FILE"
