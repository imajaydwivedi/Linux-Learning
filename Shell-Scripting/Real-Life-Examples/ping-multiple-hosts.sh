#!/bin/bash
# Purpose: Ping multiple remote host and notify

# check if an argument is provided
if [ -n "$1" ]
then
  # Split arguments by comma and loop through each host
  IFS=',' read -ra hosts <<< "$1"
else
  # Fetch unique IPv4 addresses from /etc/hosts
  readarray -t hosts < <(awk '$1 ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/ {print $1}' /etc/hosts | sort -u)
fi


# Print header with tabular formatting and underline
printf "\033[4m%-20s\t%-10s\033[0m\n" "Host" "Status"
for host in "${hosts[@]}"; do
    ping -c1 "$host" &> /dev/null
    if [ $? -eq 0 ]; then
        #echo "[$host] OK"
        printf "%-20s\t%-10s\n" "$host" "OK"
    else
        #echo "[$host] Not OK"
        printf "%-20s\t%-10s\n" "$host" "Not OK"
    fi
done

: << 'COMMENT'

-n → String is NOT Empty
-z → String is Empty

./ping-multiple-hosts.sh "192.168.1.1,8.8.8.8,google.com"


COMMENT

