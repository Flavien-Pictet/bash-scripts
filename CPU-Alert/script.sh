#!/bin/bash

# Author: Flavien-Pictet

MAX=98                  # Maximum CPU usage threshold (percentage)
EMAIL=$CPU_SCRIPT_MAIL # Email address to send alerts

while true; do
  # Get current CPU usage with the "top" command and extract the CPU percentage
  USAGE=$(top -n 1 -l 1 -o cpu | grep -Eo 'CPU usage: [0-9]+[.][0-9]+' | cut -d ' ' -f 3)

  # Check if CPU usage exceeds the defined threshold
  if (( $(echo "$USAGE > $MAX" | bc -l) )); then
    echo "CPU Usage: $USAGE%" | mail -s "High CPU Usage Alert" $EMAIL
    break  # Exit the loop once the condition is met
  fi

  sleep 60  # Sleep for 60 seconds before checking again (adjust as needed)
done
