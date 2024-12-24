#!/bin/bash

echo

# ./create-tmp-files.sh

# Get files older than 45 days
echo "Get files older than 45 days."
#find /tmp -type f -mtime +45  2>/dev/null
find /tmp -type f -mtime +45 -exec ls -lt {} \; 2>/dev/null
echo

# Rename files older than 45 days
echo
echo "Rename files older than 30 days...."
find /tmp -type f -mtime +30 -exec mv {} {}.old \; 2>/dev/null
echo

# Get files older than 45 days
echo
echo "Get files older than 45 days."
#find /tmp -type f -mtime +45  2>/dev/null
find /tmp -type f -mtime +45 -exec ls -lt {} \; 2>/dev/null
echo

# Delete files older than 45 days
echo
echo "Removing files older than 45 days...."
#find /tmp -type f -mtime +45 -delete 2>/dev/null
find /tmp -type f -mtime +45 -exec rm {} 2>/dev/null
echo

# Get files older than 30 days
echo
echo "Get files older than 30 days."
find /tmp -type f -mtime +30 -exec ls -lt {} \; 2>/dev/null

echo

: << 'COMMENT'




COMMENT