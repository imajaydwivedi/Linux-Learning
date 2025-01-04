:<<'COMMENTS'

Understanding Umask
-------------------

The "umask" is a shell setting that defines a mask that will be subtracted from the default permissions.

Default permissions on directories are 777

Default permissions on files are 666
    > "umask 022" will set default permissions on files to 644
    > "umask 027" will set default permissions on directories to 750

Global configuration (System wide)
    > /etc/profile
    > /etc/bashrc
    > /etc/login.defs

User specific configuration
    > ~/.bashrc
    > ~/.bash_profile
    > ~/.profile

Service specific configuration
    > /etc/init.d/<service_name>
    > /etc/systemd/system/<service_name>.service

    [Service]
    UMask=022

Temporary configuration (for current session)
    > umask 022

How to set default umask for new users
--------------------------------------
/etc/skel directory serves as a template directory for new user home directories.

sudo vim /etc/skel/.bashrc
    # Added by Ajay
    umask 002

Common Files in /etc/skel directory
+----------------+----------------------------------------------------------+
| File/Directory | Purpose                                                  |
+----------------+----------------------------------------------------------+
| .bashrc        | Shell configuration for non-login shells                 |
| .profile       | Shell configuration for login shells                     |
| .bash_profile  | Another login shell config (used on some systems)        |
| .bash_logout   | Commands to run when logging out of a session            |
| .vimrc         | Default Vim editor configuration                         |
| Documents/     | Template directory for user documents                    |
| Desktop/       | Template directory for desktop environment files         |
+----------------+----------------------------------------------------------+




COMMENTS

# Check current umask
umask

# find config files with umask settings
sudo grep -r umask /etc/* 2>/dev/null

# check user specific umask
sudo -u username adwivedi umask

# set umask for a user
sudo vim /home/adwivedi/.bashrc
umask 002

# 