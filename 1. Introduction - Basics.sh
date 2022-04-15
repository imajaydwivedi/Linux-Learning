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