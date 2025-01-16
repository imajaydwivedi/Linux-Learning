:<<'FIREWALL_REDHAT'

# install openssh server
sudo dnf install openssh-server

sudo systemctl start sshd
sudo systemctl enable sshd

sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

sudo systemctl status sshd




# Install RDP package on Redhat
sudo dnf install xrdp -y  # For Debian/Ubuntu
sudo systemctl enable --now xrdp

sudo dnf install virt-viewer       # Fedora/Red Hat



sudo firewall-cmd --permanent --add-port=3389/tcp
sudo firewall-cmd --reload

sudo firewall-cmd --list-ports

# test connectivity
nc -zv <server-ip> 3389


FIREWALL_REDHAT


:<<'FIREWALL_UBUNTU'

sudo apt install virt-viewer        # Debian/Ubuntu


sudo ufw allow 9090/tcp
sudo ufw allow 'Samba'

# space port
sudo ufw allow 5900/tcp


remote-viewer spice://<host_ip>:<port>


FIREWALL_UBUNTU


