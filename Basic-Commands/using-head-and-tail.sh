:<<'COMMENTS'

COMMENTS

tail /etc/passwd
head /etc/passwd

# get 3rd line of /etc/passwd
head -3 /etc/passwd | tail -1

# get logs realtime
sudo tail -f /var/log/syslog

