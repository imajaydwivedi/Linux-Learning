#!/bin/bash
# Purpose: Ping a remote host and notify

# check if an argument is provided
if [ -n "$1" ]
then host="$1"
else host="192.168.1.1"
fi

# Ternary Style
#host="${1:-192.168.1.1}"

ping -c1 $host &> /dev/null
if [ $? -eq 0 ]
then echo "[$host] OK"
else echo "[$host] Not OK"
fi

: << 'COMMENT'

-n → String is NOT Empty
-z → String is Empty

COMMENT

