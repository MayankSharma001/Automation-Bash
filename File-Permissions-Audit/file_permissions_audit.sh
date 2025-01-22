#!/bin/bash

#Define a file containing critical files and expected permissions
CONFIG_FILE="critical_files.conf"

#to check permissions
check_permissions() {
  local file=$1
  local expected=$2
  local current

  current=$(stat -c "%a" "$file" 2>/dev/null)

  if [ "$current" == "$expected" ]; then
    echo "$file is compliant. Current: $current, Expected: $expected"
  else
    echo "$file is non-compliant. Current: $current, Expected: $expected"
  fi
}

#to check configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Configuration file $CONFIG_FILE not found."
  exit 1
fi

#Audit permissions
echo "Starting file permissions audit..."
while IFS=":" read -r file expected; do
  if [ -n "$file" ] && [ -n "$expected" ]; then
    if [ -e "$file" ]; then
      check_permissions "$file" "$expected"
    else
      echo "$file does not exist. Skipping."
    fi
  fi
done < "$CONFIG_FILE"

echo "Audit complete."
