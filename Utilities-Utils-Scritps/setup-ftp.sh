# Setup FTP

# Install vsftpd
sudo apt update
sudo apt install vsftpd -y

sudo systemctl status vsftpd

# Configure vsftpd
sudo nano /etc/vsftpd.conf
    # update following key settings

    # allow local users to log in
    local_enable=YES

    # enable file uploads
    write_enable=YES

    # Restrict users to their home directory
    chroot_local_user=YES
    allow_writeable_chroot=YES

    # Enable passive mode (optional, for firewall compatibility):
    pasv_enable=YES
    pasv_min_port=10000
    pasv_max_port=10100


# Create an FTP User
    sudo adduser ftpuser
    sudo passwd ftpuser
    sudo usermod -d /home/ftpuser ftpuser

# Adjust File Permissions
    sudo chown ftpuser:ftpuser /home/ftpuser
    sudo chmod 755 /home/ftpuser

    # Replace 'ftpuser' with your actual username
    sudo chmod a-w /home/ftpuser
    sudo mkdir /home/ftpuser/uploads
    sudo chmod 755 /home/ftpuser
    sudo chmod 755 /home/ftpuser/uploads
    sudo chown ftpuser:ftpuser /home/ftpuser/uploads


# Open Ports in Firewall
    sudo ufw allow 21/tcp
    sudo ufw allow 10000:10100/tcp
    sudo ufw reload

    sudo ufw status

# Restart the FTP Service
    sudo systemctl restart vsftpd

# Test the FTP Server
    # Use an FTP client like FileZilla, Cyberduck, or the command-line ftp tool to test the connection
    ftp <server_ip>



