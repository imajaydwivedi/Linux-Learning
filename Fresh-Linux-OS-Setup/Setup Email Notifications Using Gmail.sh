# Install required packages
sudo apt update
sudo apt install mailutils postfix

# NOTE: During installation, choose "Internet Site" when prompted.

# Configure Postfix
sudo nano /etc/postfix/main.cf

    relayhost = [smtp.gmail.com]:587
    smtp_use_tls = yes
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_sasl_security_options = noanonymous


# Configure Gmail SMTP Authentication
sudo nano /etc/postfix/sasl_passwd

    [smtp.gmail.com]:587 sqlagentservice@gmail.com:your_app_password

# Set Secure Permissions
sudo postmap /etc/postfix/sasl_passwd
sudo chmod 600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

# Restart Postfix
sudo systemctl restart postfix

# Test Email Configuration
echo "Test email from Ubuntu cron" | mail -s "Test Email" ajay.dwivedi2007@gmail.com

# Enable Cron Email Notifications
crontab -e

    # Add this at the top of the crontab file:
    MAILTO="sqlagentservice@gmail.com"

    # Example Cron Job with Email Alert on Error:
    45 7 * * * /home/saanvi/GitHub/Linux-Learning/Shell-Scripting/Real-Life-Examples/ping-multiple-hosts.sh > \
            "/tmp/ping-multiple-hosts__$(date +'\%Y\%m\%d_\%H\%M').log" 2>&1 || \
            echo "Cron Job Failed" | mail -s "Cron Job Failed: ping-multiple-hosts" sqlagentservice@gmail.com


# Verify Cron Logs
grep CRON /var/log/syslog

: <<'COMMENTS'


COMMENTS