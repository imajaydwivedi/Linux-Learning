:<<'COMMENTS'

Creating Users
----------------

-> "useradd" is the main command for creating users
TIP: On Ubuntu, use "useradd -m" to ensure the user has a home directory

-> Alternative commands are available

-> When users are created, default settings from the file /etc/login.defs are applied

-> Use "useradd -D" to get an overview of currently effective default settings

Configuring Defaults for New User
----------------------------------
-> "useradd -D" shows the current default settings for new users
-> /etc/login.defs is used as the default configuration file
    -> Change it to make sure passwords are valid less than 99999 days!
-> /etc/skel contents is copied to user home directory upon user creation
-> Linux does not offer an easy solution to apply new defaults to previously created users

COMMENTS

# get manual on useradd
man 8 useradd

# get default settings
sudo useradd -D

# Get saanvi or adwivedi from /etc/passwd
grep -i -E 'saanvi|adwivedi|postgres|sshd' /etc/passwd | sort

:<<'OUTPUT'
adwivedi:x:1002:1002:Ajay Kumar Dwivedi,,,:/home/adwivedi:/bin/bash
postgres:x:136:147:PostgreSQL administrator,,,:/var/lib/postgresql:/bin/bash
saanvi:x:1000:1000:saanvi,,,:/home/saanvi:/bin/bash
sshd:x:137:65534::/run/sshd:/usr/sbin/nologin
OUTPUT

# create a user on ubuntu
sudo useradd bill
grep bill /etc/passwd

# check if home directory is created for user bill
ls /home
    # On ubuntu, no home directory would be created unless -m option is used

# remove user along with its directories
sudo userdel -rf bill

# create a user with home directory
sudo useradd -m bill

# To Restrict GUI login in lightdm (nologin)
    # https://askubuntu.com/a/575390
sudo nano /var/lib/AccountsService/users/ajay

SystemAccount=true

sudo systemctl restart accounts-daemon.service
