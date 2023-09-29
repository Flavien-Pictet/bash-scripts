## Bash Script for Getting Information About an IP Address

This simple Bash script allows you to obtain detailed information about an IP address using the ip-api.com API. It utilizes the command-line tool jq to parse the JSON data returned by the API.

## Prerequisites

jq must be installed on your system. You can install it by following the instructions at https://stedolan.github.io/jq/download/.
Usage

1. Ensure that the script is executable using the following command:

```bash
chmod +x script_ip_info.sh
```
2. Execute the script by providing an IP address as a command-line argument, for example:

```bash
./script_ip_info.sh 15.45.0.1
```
Replace 15.45.0.1 with the IP address you want to query.

The script will query the ip-api.com API and display information such as the city, region, and country of the provided IP address.
