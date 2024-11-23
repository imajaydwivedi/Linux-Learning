# Give specific user permission to write to a folder using +w notation
  # https://askubuntu.com/a/809562
setfacl -m u:username:rwx myfolder


# Additional users
Create another user ajay

Ensure to disable GUI login for ajay
Help -> https://github.com/imajaydwivedi/PostgreSQL-Learning/blob/dev/Security/create-linux-login-with-no-gui-login.sh