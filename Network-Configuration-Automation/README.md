# Task Description

As a system administrator at ”MyComp,” you need to configure the network interfaces on various servers.
This involves setting static IP addresses, configuring network interfaces, and applying DNS settings to
ensure stable and secure network connectivity. To streamline this process, you need to develop a script
that automates the configuration of network interfaces, sets static IP addresses, and applies DNS settings.

## Requirements
• Configure Network Interfaces:
  – Allow the configuration of network interfaces (e.g., eth0, eth1).

• Set Static IP Addresses:
  – Set static IP addresses, subnet masks, and gateways for specified network interfaces.

• Apply DNS Settings:
  – Configure DNS servers by updating the /etc/resolv.conf file or other relevant configuration
files.

• Input Validation:
  – Validate user inputs to ensure correct network configuration.

• Apply Configuration:
  – Apply the network configuration changes.

## Features
  - Configure network interfaces (e.g., eth0, eth1)
  - Assign static IP addresses, subnet masks, and gateways
  - Apply DNS settings by modifying /etc/resolv.conf
  - Validate user inputs to prevent misconfigurations
  - Backup existing network settings before changes

## Make the Script Executable
    - chmod +x network_config.sh

## Run the Script with Administrator Privileges
    - sudo ./network_config.sh

## Provide Inputs When Prompted
    - Network Interface: e.g., eth0
    - Static IP Address: e.g., 192.168.1.100
    - Subnet Mask: e.g., 255.255.255.0
    - Gateway: e.g., 192.168.1.1
    - DNS Server: e.g., 8.8.8.8
    
## Verify Configuration
    - ip a
    - cat /etc/resolv.conf
