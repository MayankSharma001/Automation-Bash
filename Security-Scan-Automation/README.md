# Security Scan Automation

## Task Description
As a system administrator at “MyComp,” ensuring the security of your servers is crucial. To proactively
identify and mitigate common security issues, you need to develop a script that performs security scans.
This script should check for vulnerabilities such as open ports, weak passwords, and outdated software
versions. It should then generate a detailed report highlighting these issues along with recommendations
for remediation.

## Requirements
1. Security Checks:
    - Perform scans for open ports, weak passwords, and outdated software versions.
    - Implement checks using appropriate tools and commands.
2. Remediation Recommendations:
    - Provide actionable recommendations for each identified security issue.
    - Include steps or commands to remediate the issues where possible.
3. Detailed Report:
    - Generate a comprehensive report detailing each security issue found.
    - Format the report for clarity and ease of understanding.
4. Automation and Schedule:
    - Automate the script to run periodically (e.g., daily, weekly).
    - Ensure that the script can be scheduled using cron or a similar tool.
  
# Usage
1. Give execution permission
      - chmod +x security_scan.sh
2. Run the script
      - sudo ./security_scan.sh
        
# Scheduling the Scan (Automation)
1. To run the script automatically every day at midnight, add it to cron:
      - crontab -e
2. Add this line:
      - 0 0 * * * /path/to/security_scan.sh



