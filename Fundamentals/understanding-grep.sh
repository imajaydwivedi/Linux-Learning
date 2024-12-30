:<<'COMMENTS'

grep is used to search text strings or regular expressions in files, or using a pipe in command output.


Using Common grep Options

-i: Ignores case
-v: Inverts the search
-l: list filenames that contain pattern, without showing matching lines
-A5: show line that matches pattern as well as 5 lines after
-B5: show line that matches pattern as well as 5 lines before
-C5: combined -A5 and -B5
-R: recursively searches for patten


COMMENTS

# searches text linda in all files in the current directory
grep linda *

# uses a pipe to show all lines that contain the text http in the output of the ps command
ps aux | grep http
ps aux | grep -v grep | grep http

# find files that contain text postgres
sudo grep -i postgres /etc/* 2>/dev/null
sudo grep -il postgres /etc/* 2>/dev/null

# find postgres user along with 3 lines before and after
grep -C3 postgres /etc/passwd
