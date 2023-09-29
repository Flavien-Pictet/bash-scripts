#!/bin/bash

#Author: Flavien-Pictet

## CPU Usage Alert Script

This simple Bash script monitors the CPU usage on your local machine using the "top" command. If the CPU usage exceeds a specified threshold, it sends an email alert to the designated address.

## Ensure you have the required tools installed:

Bash shell
The "top" command
Modify the script to configure the following variables:

MAX: The maximum CPU usage threshold (in percentage) that triggers an alert.
EMAIL: The email address where alerts will be sent.
