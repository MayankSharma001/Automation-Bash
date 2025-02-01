# Cron Job Management 

As a system administrator at ”MyComp,” you are responsible for managing cron jobs for various users
on the server. To simplify and streamline the management of these scheduled tasks, you need to develop
a script that allows you to list, add, or remove cron jobs for specified users. The script should ensure
that cron jobs are properly formatted and that permissions are correctly set to prevent unauthorized
modifications.

## Requirements
    • List Cron Jobs:
      – Display all cron jobs for a specified user.
    • Add Cron Jobs:
      – Add a new cron job for a specified user, ensuring proper formatting.
    • Remove Cron Jobs:
      – Remove a specific cron job for a specified user, ensuring correct permissions.
    • Permissions and Formatting:
      – Ensure that cron jobs are added or removed with proper formatting and appropriate permissions.
    • User Input and Validation:
      – Provide user-friendly prompts for input and validate the input to prevent errors.

## Requirements
- Root or sudo privileges.
- Linux system with `cron` enabled.

## Usage
Run the script:
  - sudo ./cron_manager.sh

## Example

### Listing Cron Jobs

    Cron Job Manager
    1. List cron jobs
    2. Add a cron job
    3. Remove a cron job
    Choose an option (1-3): 1
    Enter the username for managing cron jobs: john
    Listing cron jobs for user: john

### Adding a Cron Job

    Choose an option (1-3): 2
    Enter the username for managing cron jobs: john
    Enter the cron schedule (e.g., '0 5 * * *' for daily at 5 AM): 0 5 * * *
    Enter the command to execute: /home/john/backup.sh
    Cron job added successfully.

### Removing a Cron Job

    Choose an option (1-3): 3
    Enter the username for managing cron jobs: john
    Listing existing cron jobs for john:
    0 5 * * * /home/john/backup.sh
    Enter the exact line of the cron job to remove: 0 5 * * * /home/john/backup.sh
    Cron job removed successfully.


