#!/bin/bash


REPORT_FILE="/var/log/user_account_report.txt"
ADMIN_EMAIL="admin@mycomp.com"

#if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" >&2
    exit 1
fi

#Get all users from /etc/passwd
users=$(cut -d: -f1 /etc/passwd)

echo "User Account Report - $(date)" > $REPORT_FILE
echo "============================================" >> $REPORT_FILE

echo "Username | Password Expiry | Account Status" >> $REPORT_FILE
echo "-------------------------------------------" >> $REPORT_FILE

for user in $users; do
    #Get password expiration details
    expiry_info=$(chage -l "$user" 2>/dev/null | grep "Password expires" | cut -d: -f2 | xargs)
    if [[ "$expiry_info" == "never" || -z "$expiry_info" ]]; then
        expiry_info="No Expiry"
    fi

    #if password is expiring soon (within 7 days)
    expiry_date=$(chage -l "$user" 2>/dev/null | grep "Password expires" | cut -d: -f2 | xargs)
    if [[ "$expiry_date" != "never" && "$expiry_date" != "" ]]; then
        days_left=$(( ( $(date -d "$expiry_date" +%s) - $(date +%s) ) / 86400 ))
        if [[ $days_left -le 7 ]]; then
            expiry_info="Expiring Soon ($expiry_date)"
        fi
    fi

    #Get account status (check if the user account is locked)
    if passwd -S "$user" 2>/dev/null | grep -q "L"; then
        account_status="Locked"
    else
        account_status="Active"
    fi

    #Writing details to the report
    echo "$user | $expiry_info | $account_status" >> $REPORT_FILE
done


mail -s "Weekly User Account Report" "$ADMIN_EMAIL" < "$REPORT_FILE"

echo "\nReport saved to: $REPORT_FILE and emailed to $ADMIN_EMAIL"
