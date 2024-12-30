# Drivers
lsmod
lsmod | grep -i drm

# Specific Driver Help
modinfo i915

# SCSI Disk
cd /dev/
ls -l sd*
  # Block or Character Device

# List dependencies
ldd $(which passwd)

# Man Pages of glibc
man glibc

# Shell
cd /usr/lib/systemd/system
grep sysconfig *
grep -- sysconfig *

# File Descriptors - Are esentially a method of processes to get around linux system
sudo -i
cd /proc
systemctl status mssql-server.service
# node pid
cd <pid>
cat cmdline
cd fd
ls -l

# Find possible commands
whatis $(compgen -c) 2> /dev/null
whatis $(compgen -c) 2> /dev/null | grep -i 'disk'

# find all files with the work "regex" in them
grep -ri 'regex' /stale-storage/GitHub/Linux-Learning

