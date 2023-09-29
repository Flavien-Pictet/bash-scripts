#!/bin/bash

# Author : Flavien-Pictet

echo "System Information:"
echo "--------------------"
date
echo "Uptime:"
uptime

echo
echo "Memory Usage:"
free -m | awk 'NR==2{printf "Total RAM: %s MB\nFree RAM: %s MB\n", $2, $4}'

echo
echo "CPU Usage:"
top -l 1 | grep "CPU usage" | awk '{print $3}'

echo
echo "Open TCP Ports:"
nc -z -v -w 3 127.0.0.1 1-65535 2>&1 | grep "succeeded!"

echo
echo "Processes:"
ps aux | awk 'NR<=11{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $11}'

echo
echo "Disk Usage:"
df -h | grep "/dev/disk" | awk '{print "Free/Total Disk: " $4 " / " $2}'
