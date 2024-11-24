 # Task 1: User Account Creation
 
 ## Task Description
 
 ### A batch of 100 fresh engineers is joining the company ”MyComp”. As a system administrator, you need to create 100 user accounts with the following specifications:
 
 • Username and Home Directory:– Each username should be in the format mycompusr1, mycompusr2, ..., up to mycompusr100.– Eachusershould have ahomedirectory created in the format /home/mycompusr1, /home/mycompusr2,
 ..., /home/mycompusr100.
 
 • Password:– Thepasswordfor each account should be the same as the username. For example, the password
 for mycompusr1 should be mycompusr1, and so on.– The passwords should be set to expire every month.
 
 • Permissions:– Each home directory should have permissions set to 700, allowing only the respective user to
 read, write, and execute.
 
 • Group Membership:– Each user should be added to the wheel group to grant them administrative privileges.
 
 • Password Expiration Notification:– Implement a mechanism to notify users of their password expiration


 ### Explanation of the script

1. Checks if the script is run as the root user.
2. Loops through numbers 1 to 100 to create usernames.
3. For each user:
   - Creates a user account with a home directory (/home/mycompusrX).
   - Sets the user's password to be the same as their username.
   - Sets the password to expire every 30 days.
   - Adds the user to the wheel group for administrative privileges.
   - Sets the home directory permissions to 700 (only accessible by the user).
   - Prints a confirmation message after creating each user.
   - Notifies that users will receive password expiration warnings.

### TO RUN THE SCRIPT 

Make the Script Executable:
  - chmod +x create_users.sh

Run the Script:
  - sudo ./create_users.sh
