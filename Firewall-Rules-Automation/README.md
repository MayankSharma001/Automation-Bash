# Firewall Rules Automation

## Task Description
As a system administrator at “MyComp,” you are responsible for managing the firewall rules to ensure
the security of your servers. This involves configuring and managing firewall rules using firewalld or
iptables, including opening and closing specific ports. To facilitate this process, you need to develop a
script that automates the configuration of firewall rules, allowing you to easily open or close ports and
apply these changes effectively.

## Features
1. Open Ports:
    Allow the script to open specific ports for both firewalld and iptables.
2. Close Ports:
    Allow the script to close specific ports for both firewalld and iptables.
3. Display Current Rules:
    Provide an option to list current firewall rules.
4. Input Validation:
    Validate user inputs to ensure correct port numbers and protocols.
5. Apply Configuration:
    Apply the firewall rule changes effectively.
6. User-Friendly Interface:
    Provide clear prompts and feedback to the user.

## Prerequisites
- A Linux system with either `firewalld` or `iptables` installed.
- `sudo` privileges for modifying firewall rules.

## Execution
1. Make the script executable:
   ```bash
   chmod +x firewall_automation.sh
   ```
2. Run the script:
   ```bash
   ./firewall_automation.sh
   ```

## Usage
1. **Open a Port:**
   - Select option `1`.
   - Enter the port number.
   - Choose the protocol (`tcp` or `udp`).
2. **Close a Port:**
   - Select option `2`.
   - Enter the port number.
   - Choose the protocol (`tcp` or `udp`).
3. **Display Current Rules:**
   - Select option `3` to view existing firewall rules.
4. **Exit:**
   - Select option `4` to quit the script.

## Example
To open port `8080` for `tcp`, the script interaction would be:
```bash
Choose an option: 1
Enter port number to open: 8080
Enter protocol (tcp/udp): tcp
Port 8080/tcp opened using firewalld.
```

## Notes
- The script detects the installed firewall and applies rules accordingly.
- Changes made with iptables are saved persistently.
- The script ensures that inputs are validated before applying rules.


