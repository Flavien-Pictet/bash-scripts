#!/usr/bin/env bash

if ! command -v jq &>/dev/null; then
  echo 'Error: jq is not installed. Install it via https://stedolan.github.io/jq/download/'
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo 'Provide an IP address as a command line parameter. Usage:  ' "$0" ' 15.45.0.1 '
  exit 1
fi

ip_address="$1"
link="http://ip-api.com/json/$ip_address"

data=$(curl "$link" -s)
status=$(echo "$data" | jq -r '.status')

if [[ "$status" == "success" ]]; then
  city=$(echo "$data" | jq -r '.city')
  regionName=$(echo "$data" | jq -r '.regionName')
  country=$(echo "$data" | jq -r '.country')
  echo "$city, $regionName in $country."
fi
