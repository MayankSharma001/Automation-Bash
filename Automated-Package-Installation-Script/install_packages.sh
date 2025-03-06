#!/bin/bash

PACKAGES=("curl" "wget" "git" "vim")

LOG_FILE="/var/log/package_install.log"

#install packages
install_packages() {
    echo "Starting package installation..." | tee -a "$LOG_FILE"
    
    for package in "${PACKAGES[@]}"; do
        echo "Installing: $package" | tee -a "$LOG_FILE"
        if sudo apt-get install -y "$package" &>> "$LOG_FILE"; then
            echo "$package: Installation successful" | tee -a "$LOG_FILE"
        else
            echo "$package: Installation failed" | tee -a "$LOG_FILE"
        fi
    done
    echo "Installation process completed." | tee -a "$LOG_FILE"
}

#it's to Check if script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root. Use sudo." | tee -a "$LOG_FILE"
   exit 1
fi

#Update package lists
echo "Updating package lists...." | tee -a "$LOG_FILE"
sudo apt-get update -y &>> "$LOG_FILE"

install_packages
