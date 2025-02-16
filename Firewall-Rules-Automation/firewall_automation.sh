#!/bin/bash

#to check if firewalld or iptables is installed
detect_firewall() {
    if command -v firewall-cmd &> /dev/null; then
        echo "firewalld"
    elif command -v iptables &> /dev/null; then
        echo "iptables"
    else
        echo "none"
    fi
}

FIREWALL=$(detect_firewall)

if [ "$FIREWALL" == "none" ]; then
    echo "No firewall detected. Please install firewalld or iptables."
    exit 1
fi

#to open a port
open_port() {
    local port=$1
    local protocol=$2
    if [ "$FIREWALL" == "firewalld" ]; then
        sudo firewall-cmd --add-port=${port}/${protocol} --permanent
        sudo firewall-cmd --reload
        echo "Port $port/$protocol opened using firewalld."
    elif [ "$FIREWALL" == "iptables" ]; then
        sudo iptables -A INPUT -p $protocol --dport $port -j ACCEPT
        sudo iptables-save > /etc/iptables/rules.v4
        echo "Port $port/$protocol opened using iptables."
    fi
}

#to close a port
close_port() {
    local port=$1
    local protocol=$2
    if [ "$FIREWALL" == "firewalld" ]; then
        sudo firewall-cmd --remove-port=${port}/${protocol} --permanent
        sudo firewall-cmd --reload
        echo "Port $port/$protocol closed using firewalld."
    elif [ "$FIREWALL" == "iptables" ]; then
        sudo iptables -D INPUT -p $protocol --dport $port -j ACCEPT
        sudo iptables-save > /etc/iptables/rules.v4
        echo "Port $port/$protocol closed using iptables."
    fi
}

#to display current firewall rules
display_rules() {
    if [ "$FIREWALL" == "firewalld" ]; then
        sudo firewall-cmd --list-all
    elif [ "$FIREWALL" == "iptables" ]; then
        sudo iptables -L -n -v
    fi
}

#Validate port input
validate_port() {
    if [[ $1 =~ ^[0-9]+$ ]] && [ $1 -ge 1 ] && [ $1 -le 65535 ]; then
        return 0
    else
        echo "Invalid port number. Please enter a valid port between 1 and 65535."
        exit 1
    fi
}

#Menu for user interaction
while true; do
    echo -e "\nFirewall Rules Automation"
    echo "1. Open a Port"
    echo "2. Close a Port"
    echo "3. Display Current Rules"
    echo "4. Exit"
    read -p "Choose an option: " choice

    case $choice in
        1)
            read -p "Enter port number to open: " port
            validate_port $port
            read -p "Enter protocol (tcp/udp): " protocol
            open_port $port $protocol
            ;;
        2)
            read -p "Enter port number to close: " port
            validate_port $port
            read -p "Enter protocol (tcp/udp): " protocol
            close_port $port $protocol
            ;;
        3)
            display_rules
            ;;
        4)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
