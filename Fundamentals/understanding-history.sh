:<<'COMMENTS'

Understanding history
---------------------

Commands a user types are written to ~/.bash_history file.
  This file is read by the shell when it starts up and the commands are loaded into memory.
  The history command can be used to display the history of commands that have been typed.

Use "history -c" to clear the history.
use "history -w" to write the history to the file.
Use "history -r" to read the history from the file.
Use "history -d <line_number>" to delete a specific line from the history.
Use Ctrl-r for reverse-i-search.
Or use "!nn" to repeat a specific line from history

COMMENTS

# get commands from history
history

# get history file details
ls -lh ~/.bash_history

# show a listing of last logged in users
last

# check history command size & file size
    # personally, I prefer 2.5k rows and 1MB file size
grep -i '^hist.*size' ~/.bashrc