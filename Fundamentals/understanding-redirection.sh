:<<'COMMENTS'

Understanding Redirection
-------------------------

Redirection is used to manipulate input and output of commands.

Standard input (0): <
    sort < /etc/services

Standard output (1): >
    ls > /tmp/files.txt
    who >> /tmp/files.txt

Standard error (2): 2>
    grep -R root /proc 2>/dev/null
    grep -R root /etc &> /tmp/output_file

+---------------------------------------------------------------------------------+
|                               Quick Reference Table                             |
+-----------+-------------------------------+-------------------------------------+
| Symbol    | Purpose                       | Example                             |
+-----------+-------------------------------+-------------------------------------+
| >         | Redirect stdout (overwrite)   | echo "text" > file.txt              |
| >>        | Redirect stdout (append)      | echo "text" >> file.txt             |
| <         | Redirect stdin                | sort < file.txt                     |
| 2>        | Redirect stderr (overwrite)   | ls nonexistent 2> error.log         |
| 2>>       | Redirect stderr (append)      | ls nonexistent 2>> error.log        |
| &>        | Redirect stdout & stderr      | ls &> output.log                    |
| &>>       | Append stdout & stderr        | ls &>> output.log                   |
| /dev/null | Discard output/error          | ls > /dev/null 2>&1                 |
| <<        | Here Document                 | cat << EOF > file.txt               |
| <<<       | Here String                   | grep "text" <<< "hello text"        |
+-----------+-------------------------------+-------------------------------------+

Examples:

# Redirect stdout to a file
echo "Hello, World!" > file.txt

# Redirect stdout to a file (append)
echo "Another line" >> file.txt

# Redirect stderr to a file
ls nonexistentfile 2> error.log

# Redirect stderr to a file (append)
ls nonexistentfile 2>> error.log

# Redirect stdout and stderr to a file
ls file.txt nonexistentfile &> output.log

# Redirect stdout and stderr to a file (append)
ls file.txt nonexistentfile &>> output.log

# Discard output or error
echo "This won't be seen" > /dev/null

# Supress errors
ls nonexistentfile 2> /dev/null

# Input from a file and Redirect output
sort < file.txt > sorted.txt

# Pipe and Redirection Together
cat file.txt | grep "keyword" > result.txt

# Here Document (<<). Multi-Line Input. Creates file.txt with the specified lines.
cat << EOF > file.txt
This is a test file.
It has multiple lines.
EOF


# Pass String as Input
grep "hello" <<< "hello world"


COMMENTS

