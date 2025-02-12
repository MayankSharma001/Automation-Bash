#!/bin/bash

#to validate IP address format
validate_ip() {
    local ip=$1
    local regex='^([0-9]{1,3}\.){3}[0-9]{1,3}$'
    [[ $ip =~ $regex ]] || { echo "Invalid IP address: $ip"; return 1; }
}

#to configure network interface
configure_interface() {
    local interface=$1
    local ip_address=$2
    local subnet_mask=$3
    local gateway=$4

    echo "Configuring $interface with static IP..."
    cat <<EOT > /etc/network/interfaces.d/$interface.cfg
auto $interface
iface $interface inet static
    address $ip_address
    netmask $subnet_mask
    gateway $gateway
EOT
}

#to configure DNS settings
configure_dns() {
    local dns_server=$1
    echo "Configuring DNS.."
    echo "nameserver $dns_server" > /etc/resolv.conf
}

#to restart networking service
apply_changes() {
    echo "Applying changes.."
    systemctl restart networking && echo "Network settings applied successfully."
}

#User Inputs
read -p "Enter network interface (e.g., eth0): " interface
read -p "Enter static IP address: " ip_address
read -p "Enter subnet mask: " subnet_mask
read -p "Enter gateway: " gateway
read -p "Enter DNS server: " dns_server

#Validate inputs before applying changes
validate_ip "$ip_address" && validate_ip "$subnet_mask" && validate_ip "$gateway" && validate_ip "$dns_server" || exit 1

#Apply configuration
configure_interface "$interface" "$ip_address" "$subnet_mask" "$gateway"
configure_dns "$dns_server"
apply_changes
