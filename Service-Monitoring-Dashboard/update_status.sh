#!/bin/bash
# update_status.sh
# This script monitors the status of critical services and writes the results to status.json.
# It uses full paths to commands for security and reliability.

# Define the list of services to monitor
SERVICES=("httpd" "sshd" "mysql")

# Define the full path to systemctl.
# Adjust the path if needed: Ubuntu might have it in /usr/bin/systemctl.
SYSTEMCTL="/bin/systemctl"
if [ ! -x "$SYSTEMCTL" ]; then
    SYSTEMCTL="/usr/bin/systemctl"
fi

# Infinite loop to update the JSON file every 5 seconds
while true; do
    # Start the JSON object
    echo "{" > status.json
    COUNT=${#SERVICES[@]}
    INDEX=0
    for SERVICE in "${SERVICES[@]}"; do
        INDEX=$((INDEX + 1))
        # Check the service status using the full path command
        STATUS=$($SYSTEMCTL is-active "$SERVICE" 2>/dev/null)
        if [ "$STATUS" == "active" ]; then
            RESULT="Running"
        else
            RESULT="Stopped"
        fi

        # Write the key-value pair, without a trailing comma on the last element
        if [ "$INDEX" -eq "$COUNT" ]; then
            echo "  \"$SERVICE\": \"$RESULT\"" >> status.json
        else
            echo "  \"$SERVICE\": \"$RESULT\"," >> status.json
        fi
    done
    # Close the JSON object
    echo "}" >> status.json

    # Wait for 5 seconds before the next update
    sleep 5
done
