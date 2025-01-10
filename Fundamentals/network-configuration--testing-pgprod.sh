ip addr show

:<<'COMMAND_OUTPUT'
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:d1:d6:fa brd ff:ff:ff:ff:ff:ff
    inet 192.168.100.18/16 brd 192.168.255.255 scope global noprefixroute enp1s0
       valid_lft forever preferred_lft forever
4: enp10s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:60:66:66 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.18/24 brd 192.168.1.255 scope global noprefixroute enp10s0
       valid_lft forever preferred_lft forever
    inet6 fe80::886f:e848:9646:963b/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
COMMAND_OUTPUT

# fetch details of enp1s0 adapter
ip addr show enp1s0

:<<'COMMAND_OUTPUT'
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:d1:d6:fa brd ff:ff:ff:ff:ff:ff
    inet 192.168.100.18/16 brd 192.168.255.255 scope global noprefixroute enp1s0
       valid_lft forever preferred_lft forever
    inet 192.168.100.19/24 scope global enp1s0
       valid_lft forever preferred_lft forever
    inet6 fe80::b6f7:6039:9bce:681b/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
COMMAND_OUTPUT

# remove existing ip for enp1s0 adapter
sudo ip addr del 192.168.100.18/16 dev enp1s0

# Set new temp ip address
sudo ip addr add dev enp1s0 192.168.100.19/24

# Modify host entry on ssh client side. Replace pgprod ip from 192.168.100.18 to 192.168.100.19
sudo sed -i 's/^192\.168\.100\.18\(\s\+pgprod\)/192.168.100.19\1/' /etc/hosts
cat /etc/hosts | grep -i pgprod

# Since ip address has change, if we do ssh, we should face error of Host Key mismatch
ssh adwivedi@prod

    :<<'COMMAND_OUTPUT'
WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

Offending ECDSA key in /user/saanvi/.ssh/known_hosts:84
COMMAND_OUTPUT

# Remove host key from known_hosts on client
sed -i -e '84d' ~/.ssh/known_hosts

# Try ssh again
ssh adwivedi@prod

# Find port for sshd
sudo systemctl status ssh.service
sudo systemctl status sshd.service
    # Notice the line with "Server listening on :: port 22"
    :<<'COMMAND_OUTPUT'
|------------$ sudo systemctl status ssh.service
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-01-10 11:34:30 IST; 2min 50s ago
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 442879 (sshd)
      Tasks: 1 (limit: 154384)
     Memory: 2.1M (peak: 4.0M)
        CPU: 25ms
     CGroup: /system.slice/ssh.service
             └─442879 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Jan 10 11:34:30 ryzen9 systemd[1]: Starting ssh.service - OpenBSD Secure Shell server...
Jan 10 11:34:30 ryzen9 sshd[442879]: Server listening on :: port 22.
Jan 10 11:34:30 ryzen9 systemd[1]: Started ssh.service - OpenBSD Secure Shell server.
Jan 10 11:34:30 ryzen9 sshd[442880]: Accepted publickey for saanvi from 192.168.1.2 port 61556 ssh2: ED25519 SHA256:eISY5ptgkQ+1emaeqKTMdZGj7EnxDaG7fr6MBQj8oU4
COMMAND_OUTPUT

# Reset the ip address of pgprod by rebooting
hostname
sudo reboot now

# Modify host entry on ssh client side. Replace pgprod ip from 192.168.100.18 to 192.168.100.19
sudo sed -i 's/^192\.168\.100\.19\(\s\+pgprod\)/192.168.100.18\1/' /etc/hosts
cat /etc/hosts | grep -i pgprod

