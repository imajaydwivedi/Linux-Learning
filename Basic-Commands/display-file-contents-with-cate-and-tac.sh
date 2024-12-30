:<<'COMMENTS'

cat has some nice options

-A, --shows all non-printable characters
-b, --number lines, but not empty lines
-n, --number lines
-s, --suppress repeated empty output lines


COMMENTS

# get the content of /etc/hosts
cat -sb /etc/hosts

# Get non-printable characters
cat -Ab /etc/hosts