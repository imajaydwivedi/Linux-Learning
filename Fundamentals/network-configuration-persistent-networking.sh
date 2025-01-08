:<<'COMMENTS'

Configuring Persistent Networking
----------------------------------

-> NetworkManager is the common service that takes care of persistent networking

-> To configure NetworkManager, tools like nmtui (recommended) or nmcli (more advanced) are used

-> The configuration is written to configuration files


COMMENTS

# Open textual graphic interface to set network configuration
sudo nmtui

# Get an IP address for the eth0 interface:
sudo dhclient eth0

# Release an IP address for the eth0 interface:
sudo dhclient -r eth0

