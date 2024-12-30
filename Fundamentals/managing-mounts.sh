:<<'COMMENTS'
Managing Mounts
COMMENTS

# list block devices excluding loop devices
lsblk -e7

# lists all current mounts
mount

# presents mounted devices, including available space
df -h

# show all mounts
findmnt

# unmount a device
sudo umount /dev/sdb

# mount a device
sudo mount /dev/sdb /mnt/usb_drive
