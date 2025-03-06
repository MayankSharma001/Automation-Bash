# Automated Package Installation Script

As a system administrator at “MyComp,” you are responsible for maintaining and configuring multiple
servers. This includes ensuring that specific software packages are installed on these systems. To
streamline this process, you need to develop a script that automates the installation of a list of specified
packages. The script should handle dependencies, verify successful installation, and provide a report on
the installation status of each package.

## Requirements

1. Package List:
      - Specify a list of packages to be installed.
2. Dependency Management:
      - Automatically check for and install any dependencies required by the specified packages.
3. Installation Verification:
      - Verify that each package has been successfully installed.
4. Error Handling:
      - Handle errors gracefully and provide meaningful error messages if a package fails to install.
5. Installation Report:
      - Generate a report indicating the installation status of each package (successful or failed).
  
## Prerequisites

1. The script must be run as a root user or with sudo.

2. The system must have an active internet connection.

3. Supported on Debian-based systems (Ubuntu etc).

## Package List

- The script installs the following packages by default:
    - curl
    - wget
    - git
    - vim
- These can be modified in the PACKAGES array inside the script.

## Installation and Execution

1. Download the Script
    - Save the script as install_packages.sh.
2. Provide Execution Permissions
    - chmod +x install_packages.sh
3. Run the Script
    - sudo ./install_packages.sh

## Logging

1. The script logs all actions to /var/log/package_install.log.
2. The log contains success and failure messages for each package.

## Error Handling

1. If the script is not run with sudo, it exits with an error.
2. If a package fails to install, the failure is logged.
3. If package lists fail to update, the script will still attempt installation.
