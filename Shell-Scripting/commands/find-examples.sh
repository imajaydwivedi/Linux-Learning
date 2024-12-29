# Get inbuild examples on find using tldr command
tldr find

# Create 5 directories
mkdir /tmp/dba_log_dir_[a-e].d

# find exact match
find / -name "hosts" 2>/dev/null

# find pattern match
find / -name "*hosts*" 2>/dev/null

# files owned by postgres user
find / -user postgres

# files over 2 gb size
sudo find / -size +2G -exec ls -lhS {} \+

# files over 2 gb size with human readable format
find / -type f -size +2G -exec ls -lSh {} \+ 2>/dev/null

# copy all files with postgres keyword in name to /tmp
sudo find /etc -exec grep -l postgres {} \; -exec cp {} /tmp/ \;

# Search for text in all files in /etc directory
find /etc/ -name '*' -type f 2>/dev/null | xargs grep "127.0.0.1" 2>/dev/null

grep -rI "127.0.0.1" /etc/ 2>/dev/null

# Find all files with .conf extension and sort by size
find /etc -name "*.conf" -printf '%s, %p\n' | sort -nr

find /etc -name "*.conf" -printf '%s %p\n' | sort -nr | awk '{printf "%.2f MB, %s\n", $1/1024/1024, $2}'

du -ah /etc/*.conf | sort -hr
