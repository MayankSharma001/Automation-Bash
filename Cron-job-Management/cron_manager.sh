#!/bin/bash

#list cron jobs for a user
list_cron_jobs() {
    local user=$1
    echo "Listing cron jobs for user: $user"
    sudo crontab -u "$user" -l 2>/dev/null || echo "No cron jobs found or insufficient permissions."
}

#add a new cron job for a user
add_cron_job() {
    local user=$1
    local schedule
    local command

    echo "Enter the cron schedule (e.g., '0 5 * * *' for daily at 5 AM):"
    read -r schedule

    echo "Enter the command to execute:"
    read -r command

    #Validate cron schedule format
    if ! echo "$schedule" | grep -Eq '^(\*|[0-9,-\/]+) (\*|[0-9,-\/]+) (\*|[0-9,-\/]+) (\*|[0-9,-\/]+) (\*|[0-9,-\/]+)$'; then
        echo "Invalid cron schedule format."
        exit 1
    fi

    #Validate command is not empty
    if [[ -z "$command" ]]; then
        echo "Command cannot be empty."
        exit 1
    fi

    (sudo crontab -u "$user" -l; echo "$schedule $command") | sudo crontab -u "$user" -
    echo "Cron job added successfully."
}

#remove a cron job for a user
remove_cron_job() {
    local user=$1
    echo "Listing existing cron jobs for $user:"
    sudo crontab -u "$user" -l

    echo "Enter the exact line of the cron job to remove:"
    read -r job_to_remove

    if [[ -z "$job_to_remove" ]]; then
        echo "Invalid input."
        exit 1
    fi

    sudo crontab -u "$user" -l | grep -vF "$job_to_remove" | sudo crontab -u "$user" -
    echo "Cron job removed successfully."
}

#menu
echo "Cron Job Manager"
echo "1. List cron jobs"
echo "2. Add a cron job"
echo "3. Remove a cron job"
read -rp "Choose an option (1-3): " choice

echo "Enter the username for managing cron jobs:"
read -r username

case $choice in
    1) list_cron_jobs "$username" ;;
    2) add_cron_job "$username" ;;
    3) remove_cron_job "$username" ;;
    *) echo "Invalid option." ;;
esac
