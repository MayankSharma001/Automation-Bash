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
