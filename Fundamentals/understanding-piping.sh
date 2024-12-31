:<<'COMMENTS'

Understand Piping
-----------------

A pipe is used to send the output of one command to be used as input for a second command

    ps aux | grep http

The "tee" command combines redirection and piping. It allows you to write
  output to somwhere, and at the same time use it as input for another command.

    ps aux | tee /tmp/processes.txt | grep ssh


Examples:
---------

# Monitor Real-Time Log Changes with Highlights
tail -f /var/log/syslog | grep --line-buffered "error" | sed 's/error/\x1b[31m&\x1b[0m/g'

# Find and Sort the Largest Files
sudo find /var/log -type f -exec du -h {} + | sort -rh | head -5

# Get a Weather Update in Terminal
curl -s wttr.in | grep -A 7 "Weather report" | sed 's/^[ \t]*//'

# Check System Memory and Highlight Low Free Memory
free -h | grep Mem | awk '{if ($4 ~ /[0-9]/) print "Free Memory: " $4}' | sed 's/Free Memory/\x1b[32m&\x1b[0m/'

# Create a table of Users and their Shells
cut -d: -f1,7 /etc/passwd | column -t -s: | sort

# Disk Usage Visualization in a Tree-like Format
du -h --max-depth=1 /home | sort -rh | awk '{print $2 ": " $1}'

# Search and Display Matching Files with Line Numbers
grep -rn "TODO" /path/to/project | less

# Fun with Fortune, Cowsay, and Lolcat
fortune | cowsay | lolcat

(base) ----- [2024-Dec-31 06:25:37] saanvi@ryzen9 (Linux-Learning)
|------------$ cat << EOF | cowsay | lolcat
> Learning is key to success
>
> -- Ajay Dwivedi
> EOF
 ____________________________
/ Learning is key to success \
|                            |
\ -- Ajay Dwivedi            /
 ----------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
(base) ----- [2024-Dec-31 06:26:19] saanvi@ryzen9 (Linux-Learning)

# Download and Extract in One Command
curl -L "https://example.com/file.tar.gz" | tar -xz

# Find and Replace Across Multiple Files
grep -rl "foo" . | xargs sed -i 's/foo/bar/g'



COMMENTS
 