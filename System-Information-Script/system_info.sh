#!/bin/bash

# Function to display CPU information
cpu_info() {
    echo "--- CPU Information ---"
    lscpu | grep -E 'Model name|CPU MHz|CPU(s):'
    echo "CPU Usage Statistics:"
    mpstat | tail -2
    echo
}

# Function to display memory information
memory_info() {
    echo "--- Memory Information ---"
    free -h | awk 'NR==1 || NR==2 {print}'
    echo
}

# Function to display disk usage
disk_usage() {
    echo "--- Disk Usage ---"
    df -h --total
    echo
}

# Function to display network configuration
network_info() {
    echo "--- Network Configuration ---"
    ip -brief addr show
    echo
}

# Function to display running processes
running_processes() {
    echo "--- Running Processes ---"
    ps aux --sort=-%cpu,-%mem | awk 'NR==1 || NR<=11 {print}'
    echo
}

clear

echo "========================================="
echo "          System Information            "
echo "========================================="
echo

cpu_info
memory_info
disk_usage
network_info
running_processes
