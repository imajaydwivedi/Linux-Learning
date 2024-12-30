:<<'COMMENTS'

More or Less?

COMMENTS

# on Redhat distros
sudo more /var/log/messages

# on Debian distros
sudo ls -lt /var/log/
sudo ls -lSh /var/log/

sudo more /var/log/syslog
sudo less /var/log/syslog
sudo less -f /var/log/syslog

sudo journalctl | less
sudo journalctl --since "1 hour ago"
sudo journalctl -f
sudo journalctl -p err


