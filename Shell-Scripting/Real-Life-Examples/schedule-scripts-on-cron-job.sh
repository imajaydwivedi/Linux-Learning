# Command to run
/home/saanvi/GitHub/Linux-Learning/Shell-Scripting/Real-Life-Examples/ping-multiple-hosts.sh > "/tmp/ping-multiple-hosts__$(date +'%Y%m%d_%H%M').log" 2>&1

# Edit the crontab file (in nano editor)
VISUAL=nano crontab -e

crontab -e

# Schedule for 7:45 AM everyday, and save the details in a log file
0 8 * * * /bin/bash /home/saanvi/GitHub/Linux-Learning/Shell-Scripting/Real-Life-Examples/ping-multiple-hosts.sh > "/tmp/ping-multiple-hosts__$(date +'\%Y\%m\%d_\%H\%M').log" 2>&1

# Schedule for 7:45 AM everyday, and send the results to the email
0 8 * * * /bin/bash /home/saanvi/GitHub/Linux-Learning/Shell-Scripting/Real-Life-Examples/ping-multiple-hosts.sh | \
        mail -s "Cron Job - Connectivity Status - ping-multiple-hosts.sh" sqlagentservice@gmail.com

# Verify
crontab -l

