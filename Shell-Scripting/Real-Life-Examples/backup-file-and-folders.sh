#!/bin/bash

backup_file="/tmp/backups_$(date +%Y%m%d).tar"

# Generate tarball for /etc directory
tar -czvf "$backup_file" /etc /var 2>/dev/null

# Get top 10 files on /tmp sorted by Size in human readable format
ls -lhS /tmp | head 10

# Get files larger than 1 gb on /tmp
find /tmp -type f -size +1G -exec ls -lhS {} +

# Get files larger than 1 gb on /tmp ignoring errors
find /tmp -type f -size +1G -exec ls -lhS {} \; 2>/dev/null

# copy backup tarball to ftp server using scp (Secure Copy Protocol)
scp -v "$backup_file" adwivedi@alertengine:/tmp