#!/bin/bash

EMAIL="admin@mycomp.com"

SUBJECT="Daily Disk Usage Report - $(date +"%Y-%m-%d")"

# Generate disk usage report
REPORT=$(df -h)

# Send the email with the report
echo "$REPORT" | mail -s "$SUBJECT" "$EMAIL"
