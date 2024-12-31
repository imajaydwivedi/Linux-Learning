:<<'COMMENTS'

Understanding Variables
-----------------------

A variable is a label to which a dynamic value can be assigned.

Convenient for scripting: Define the variable once and use it multiple times.

System variables contain default settings used by Linux
    echo $PATH
    echo $SHELL

Environment variables can be set for application use
    Use varname=value to define
    Use echo $varname to read

    env | less
    evn | grep -i editor
    echo $PATH
    echo $USER

By default, variables are only known to the current shell
    Use export to export it to all subshells


COMMENTS

