# System Information Script

### I aimed to make the script modular and will strive to maintain this approach in future projects as well.

## Overview
The **System Information Script** is a comprehensive tool designed for system administrators at "MyComp." It provides detailed system information to monitor server health, diagnose issues, and perform routine checks efficiently. This script retrieves and displays data related to the CPU, memory, disk usage, network configuration, and running processes.

---

## Features

### 1. CPU Information
- Displays detailed information about the CPU, including:
  - Model Name
  - Speed (CPU MHz)
  - Number of CPUs
  - Usage statistics
- Utilizes the `lscpu` and `mpstat` commands for precise data.

### 2. Memory Information
- Shows:
  - Total memory
  - Used memory
  - Available memory
- Information is presented in a human-readable format using the `free` command.

### 3. Disk Usage
- Displays the usage of all mounted filesystems.
- Includes a summary of total disk usage.
- Data is retrieved using the `df` command.

### 4. Network Configuration
- Shows:
  - Network interfaces
  - IP addresses
  - Subnet masks
  - MAC addresses
- Data is formatted using the `ip` command.

### 5. Running Processes
- Lists currently running processes sorted by CPU and memory usage.
- Shows the top 10 processes for quick review.
- Data is retrieved using the `ps` command.

---

## Script Usage

### Prerequisites
- Ensure that the following commands are available on your system:
  - `lscpu`
  - `mpstat`
  - `free`
  - `df`
  - `ip`
  - `ps`
- The script is compatible with Linux-based systems.

### How to Run the Script
1. Clone the repository or download the script file.
2. Make the script executable:
   ```bash
   chmod +x system_info.sh
   ```
3. Run the script:
   ```bash
   ./system_info.sh
   ```


