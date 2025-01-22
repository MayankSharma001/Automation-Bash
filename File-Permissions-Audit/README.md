# File Permissions Audit

## Task Description
As a system administrator at ”MyComp,” you are tasked with ensuring the security and integrity of
critical system files and directories. Unauthorized changes to file permissions can pose significant security
risks. To mitigate this, you need to develop a script that audits file permissions on critical system files
and directories, compares them against expected permissions, and generates a report highlighting any
deviations. This report will help in identifying and addressing potential security issues promptly.

### Requirements
    • Specify Critical Files and Directories:
      – Identify a list of critical system files and directories whose permissions need to be audited.
    • Expected Permissions:
      – Define the expected permissions for each of these files and directories.
    • Audit Permissions:
      – Compare the current permissions of the specified files and directories with the expected permissions.
    • Generate Report:
      – Generate a report highlighting any deviations from the expected permissions.
    • Readable Output:
      – Present the audit results in a clear and readable format.
    • Automation:
      – Optionally, set up the script to run at regular intervals using cron jobs (e.g., daily or weekly).




## Features
- Audits critical system files and directories.
- Compares current file permissions against expected values.
- Generates a human-readable report of compliant and non-compliant files.
- Supports configuration via an external file (`critical_files.conf`).
- Can be automated using cron jobs for periodic audits.

## Prerequisites
- A configuration file (`critical_files.conf`) listing critical files and their expected permissions.

## Configuration
Create a `critical_files.conf` file in the following format:
```
/path/to/file:expected_permission
```
### Example:
```
/etc/passwd:644
/etc/shadow:600
/var/www/html:755
```

## Script Usage

### Step 1: Make the Script Executable
```bash
chmod +x file_permissions_audit.sh
```

### Step 2: Run the Script
```bash
./file_permissions_audit.sh
```

### Sample Output
```
Starting file permissions audit...
/etc/passwd is compliant. Current: 644, Expected: 644
/etc/shadow is non-compliant. Current: 640, Expected: 600
/var/www/html is compliant. Current: 755, Expected: 755
Audit complete.
```

## Automating the Script
To schedule the script for periodic execution, use cron:

1. Open the crontab editor:
   ```bash
   crontab -e
   ```

2. Add the following line to run the script daily at 2 AM:
   ```bash
   0 2 * * * /path/to/file_permissions_audit.sh
   ```

3. Save and exit. The script will now run automatically.


## Sample Configuration File
`critical_files.conf`:
```
/etc/passwd:644
/etc/shadow:600
/var/www/html:755
/tmp:1777
```

