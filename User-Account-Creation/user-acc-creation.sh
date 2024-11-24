#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script as root."
  exit 1
fi

# Create users from mycompusr1 to mycompusr100
for i in $(seq 1 100); do
  USERNAME="mycompusr$i"
  HOME_DIR="/home/$USERNAME"

  # Create the user with a home directory
  useradd -m -d "$HOME_DIR" -s /bin/bash "$USERNAME"

  # Set the password to be the same as the username
  echo "$USERNAME:$USERNAME" | chpasswd

  # Set password to expire every 30 days
  chage -M 30 "$USERNAME"

  # To add the user to the wheel group 
  usermod -aG wheel "$USERNAME"

  # Setting the home directory permissions to 700
  chmod 700 "$HOME_DIR"

  echo "Created user: $USERNAME"
done

# Notification about password expiration setup=
echo "Password expiration set to 30 days for all users."
echo "Users will receive notifications before their passwords expire."
