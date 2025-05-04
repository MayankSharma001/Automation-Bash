#!/bin/bash

#===== Configuration =====
EMAIL="admin@mycomp.com"   #Change this to your email
CPU_LIMIT=90
MEM_LIMIT=80
DISK_LIMIT=85
LOG="/var/log/resource_alerts.log"


send_alert() {
  TYPE=$1
  VALUE=$2
  TIME=$(date "+%Y-%m-%d %H:%M:%S")

  echo -e "Warning: High $TYPE usage on $(hostname)\nUsage: $VALUE%\nTime: $TIME" | \
  mail -s "ALERT: $TYPE usage on $(hostname)" "$EMAIL"

  echo "$TIME - $TYPE usage at $VALUE%" >> "$LOG"
}


check_cpu() {
  CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
  [ "$CPU_USAGE" -ge "$CPU_LIMIT" ] && send_alert "CPU" "$CPU_USAGE"
}

check_memory() {
  MEM_USAGE=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
  [ "$MEM_USAGE" -ge "$MEM_LIMIT" ] && send_alert "Memory" "$MEM_USAGE"
}


check_disk() {
  df -h --output=pcent,target | tail -n +2 | while read USAGE MOUNT; do
    USAGE_NUM=$(echo $USAGE | tr -d '%')
    [ "$USAGE_NUM" -ge "$DISK_LIMIT" ] && send_alert "Disk at $MOUNT" "$USAGE_NUM"
  done
}


check_cpu
check_memory
check_disk
