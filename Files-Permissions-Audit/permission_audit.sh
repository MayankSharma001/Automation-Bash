#!/bin/bash

#critical files and their expected permissions (You can add more files too as per your needs)
declare -A FILES=(
    ["/etc/passwd"]="-rw-r--r--"
    ["/etc/shadow"]="----------"
    ["/etc/group"]="-rw-r--r--"
    ["/etc/hosts"]="-rw-r--r--"
)

#This is the output file where the output will be stored
REPORT_FILE="/var/log/permission_audit.log"

#to initialize the report file
initialize_report() {
    echo "File Permissions Audit - $(date)" > "$REPORT_FILE"
    echo "------------------------------------" >> "$REPORT_FILE"
}

#to check file permissions
check_permissions() {
    local file="$1"
    local expected_perm="$2"
    
    if [ -e "$file" ]; then
        local current_perm
        current_perm=$(ls -l "$file" | awk '{print $1}')
        if [ "$current_perm" != "$expected_perm" ]; then
            echo "WARNING: Permission mismatch for $file" >> "$REPORT_FILE"
            echo "Expected: $expected_perm, Found: $current_perm" >> "$REPORT_FILE"
        fi
    else
        echo "ERROR: $file not found!" >> "$REPORT_FILE"
    fi
}

#to run the audit
run_audit() {
    for file in "${!FILES[@]}"; do
        check_permissions "$file" "${FILES[$file]}"
    done
    echo "Audit completed. Check $REPORT_FILE for details."
}


initialize_report
run_audit
