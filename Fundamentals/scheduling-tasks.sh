:<<'COMMENTS'

Scheduling Tasks
------------------------------

-> "cron": the classical solution, allows you to schedule re-occurring tasks
    -> Uses the "crond" daemon
        systemctl status cron.service # Ubuntu
        systemctl status crond.service # Redhat
    -> Use "crontab -e" to edit tasks

-> "at" for tasks that need to run once only
    -> Uses the "atd" daemon
    -> Uses "at" to schedule the tasks

-> systemd timers: the newer alternative to cron jobs
    -> Create a .timer unit and run it using systemctl

    sudo systemctl list-units -t timer
    sudo systemctl list-unit-files -t timer


cat /etc/crontab

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.daily; }
47 6    * * 7   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.weekly; }
52 6    1 * *   root    test -x /usr/sbin/anacron || { cd / && run-parts --report /etc/cron.monthly; }


COMMENTS

# get syntax for crontab entry
sudo cat /etc/crontab

# 
sudo ls /etc/cron.*
    :<<'COMMAND_OUTPUT'
    /etc/cron.d:
    anacron  certbot  e2scrub_all  sysstat

    /etc/cron.daily:
    0anacron  apache2  apport  apt-compat  brave-browser  dpkg  google-chrome  logrotate  man-db  slack  sysstat

    /etc/cron.hourly:

    /etc/cron.monthly:
    0anacron

    /etc/cron.weekly:
    0anacron  man-db

    /etc/cron.yearly:
COMMAND_OUTPUT

# Add recurring task to crontab
sudo crontab -e

    # send message to default logging system every 13th minute
    13 * * * * logger HELLO AJAY

# check log
sudo journalctl
# view logs since last boot
journalctl -b
# Follow logs for a specific time range
journalctl --since "2025-01-13 10:00:00" --until "2025-01-13 12:00:00"
# Filter logs by Unit (service)
journalctl -u ngix
# Filter logs by Priority level
    # Replace priority with levels like emerg, alert, crit, err, warning, notice, info, or debug
journalctl -p priority
# By Specific User:
journalctl _UID=1000
# Limit output
journalctl -n 50
# Export logs
journalctl > system_logs.txt





# Setup mail with schedule notification
    # ./Fresh-Linux-OS-Setup/Setup Email Notifications Using Gmail.sh


# check unit files for specific task
systemctl list-unit-files fstrim*
sudo systemctl cat fstrim.timer

    :<<'COMMAND_OUTPUT'
    |------------$ systemctl list-unit-files fstrim*
    UNIT FILE      STATE   PRESET
    fstrim.service static  -
    fstrim.timer   enabled enabled

    2 unit files listed.


    |------------$ sudo systemctl cat fstrim.timer
    # /usr/lib/systemd/system/fstrim.timer
    [Unit]
    Description=Discard unused filesystem blocks once a week
    Documentation=man:fstrim
    ConditionVirtualization=!container
    ConditionPathExists=!/etc/initrd-release

    [Timer]
    OnCalendar=weekly
    AccuracySec=1h
    Persistent=true
    RandomizedDelaySec=100min

    [Install]
    WantedBy=timers.target
COMMAND_OUTPUT

# On Redhat
sudo systemctl status atd






