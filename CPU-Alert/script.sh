#!/bin/bash

MAX=98          # Maximum CPU usage threshold (percentage)
EMAIL=$CPU_SCRIPT_MAIL   # Email address to send alerts

# Get current CPU usage with the "top" command
USAGE=$(top -n 1 -l 1 -o cpu | grep "CPU usage" | awk '{print $3}' | cut -d '%' -f 1)

# Check if CPU usage exceeds the defined threshold
if [ "$USAGE" -gt "$MAX" ]; then
  echo "CPU Usage: $USAGE%" | mail -s "High CPU Usage Alert" $EMAIL
fi
