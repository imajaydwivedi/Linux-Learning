:<<'COMMENTS'

cut
  is an easy-to-use command that filters out columns from text files.

To to its work properly, you need to specify the field delimiter, using -d

For help on /etc/passwd, check etc_passwd_file.sh

Compare the following:
    cut -f 3 /etc/passwd
    cut -d : -f 3 /etc/passwd

# Get Help
cut --help

# get Username, UID, and default shell, and sort
    cut -d ":" -f 1,3,7 /etc/passwd | sort

# get UID, UserName, and default shell, and sort by UID in numeric order
cut -d ":" -f 1,3,7 /etc/passwd | sort -t: -k2,2n | awk -F: '{printf "%-10s %-15s %-20s\n", $2, $1, $3}'

awk -F: '{print $3 ":" $1 ":" $7}' /etc/passwd | sort -t: -k1,1n | awk -F: '{printf "%-10s %-15s %-20s\n", $1, $2, $3}'


# Get Examples
|------------$ tldr cut
cut

Cut out fields from stdin or files.
More information: https://www.gnu.org/software/coreutils/manual/html_node/cut-invocation.html.

 - Print a specific [c]haracter/[f]ield range of each line:
   command | cut --characters|fields 1|1,10|1-10|1-|-10

 - Print a [f]ield range of each line with a specific [d]elimiter:
   command | cut --delimiter "," --fields 1

 - Print a [c]haracter range of each line of the specific file:
   cut --characters 1 path/to/file

 - Print specific [f]ields of NUL terminated lines (e.g. as in find . -print0) instead of newlines:
   command | cut --zero-terminated --fields 1

COMMENTS

:<<'COMMENTS'

sort
  is often used with cut to sort the result of the cut command

Use sort -n to sort in numeric order

Compare the following:
    cut -d : -f 3 /etc/passwd | sort
    cut -d : -f 3 /etc/passwd | sort -n

COMMENTS

