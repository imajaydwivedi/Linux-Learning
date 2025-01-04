:<<'COMMENTS'

-> The "xargs" command is used to build and execute command lines from standard input.
    It takes input (like a lit of filenames from "find" command) and
    executes a command (eg, ls, cp, rm) on each item in the input

xargs Syntax:
    xargs [options] [command [initial-arguments]]

Options: Control how "xargs" behaves (eg, handle spaces, limit execution, etc)

Key Options for xargs:
    -0: Use NULL as delimiter. Useful when handling filenames with spaces
    -I: Replace string with input. Useful when you want to use input in the middle of the command
    -n: Limit the number of arguments passed to the command
    -P: Run multiple processes in parallel

Examples:

    # Example 01. create 2 files
    echo "file1.txt file2.txt" | xargs touch

    # Example 02. find files in /etc, and list permissions.
        # NOTE: If any file name contains spaces, xargs might misinterpret it
    find /etc/ -type f | xargs ls -l
        # To not include child directories
    find /etc/ -maxdepth 1 -type f | xargs ls -l

    # Example 03. Handling filenames with spaces
    cd /tmp
    mkdir dump_files
    touch "my long file name.txt"

    find /tmp/ -maxdepth 1 -type f | xargs -d '\n' ls -l
    find /tmp/ -type f -print0 | xargs -0 ls -l

    # Example 04. Using -I option
        # get files on dump_files directory
    find ./dump_files/ -maxdepth 1 -type f
        # delete all files in dump_files directory
    find ./dump_files/ -type f | xargs -d '\n' rm -f
        # copy
    find . -maxdepth 1 -type f -name 'file?.txt' | xargs -d '\n' -I {} cp {} ./dump_files/
    echo "file1.txt file2.txt" | xargs -I {} cp {} ./dump_files/





COMMENTS

