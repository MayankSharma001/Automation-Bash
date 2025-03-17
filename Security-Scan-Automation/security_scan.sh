#!/bin/bash

REPORT_FILE="security_report_$(date +%Y%m%d).txt"

#this is to check for open ports
check_open_ports() {
    echo "Checking for open ports..." | tee -a "$REPORT_FILE"
    netstat -tuln | awk 'NR>2 {print $4}' | cut -d: -f2 | sort -u | tee -a "$REPORT_FILE"
    echo "Recommendation: Close unnecessary ports using the firewall (iptables/nftables)." | tee -a "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

#to check for weak passwords using pwunconv and pwconv
check_weak_passwords() {
    echo "Checking for weak passwords..." | tee -a "$REPORT_FILE"
    
    # Convert shadow passwords to passwd format. Basically remove the hashed format 
    pwunconv
    
    # Read /etc/passwd and check for simple passwords (basic check)
    awk -F: 'length($2) < 8 {print "Weak password detected for user:", $1}' /etc/passwd | tee -a "$REPORT_FILE"
    
    #Convert passwd format back to shadow for security. basically convert the normal text back to the hashed format
    pwconv
    
    echo "Recommendation: Use strong passwords with uppercase, lowercase, numbers, and special characters." | tee -a "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

#to check for outdated software (Debian specific)
check_outdated_software() {
    echo "Checking for outdated software..." | tee -a "$REPORT_FILE"
    apt list --upgradable | tee -a "$REPORT_FILE"
    echo "Recommendation: Update software regularly using: sudo apt update && sudo apt upgrade -y" | tee -a "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

#generate the final report
generate_report() {
    echo "Security Scan Report - $(date)" > "$REPORT_FILE"
    echo "======================================" >> "$REPORT_FILE"
    check_open_ports
    check_weak_passwords
    check_outdated_software
    echo "Security scan completed. Review $REPORT_FILE for details."
}


generate_report
