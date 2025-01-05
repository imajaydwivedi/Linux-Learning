:<<'COMMENTS'

Making Mounts Persistent
------------------------

/etc/fstab





COMMENTS

# add entry for persistent mounting in /etc/fstab
sudo nano /etc/fstab

    /dev/vdb1       /disk_vdb1_5g   ext4    defaults        0 0

# validate the entry
adwivedi@pgprod:~$ sudo mount -a

    mount: /disk_vdb1_5g: mount point does not exist.
        dmesg(1) may have more information after failed mount system call.
    mount: (hint) your fstab has been modified, but systemd still uses
        the old version; use 'systemctl daemon-reload' to reload.

# fix the above error
sudo mkdir /disk_vdb1_5g

# re-validate the entry
sudo mount -a

# check mounts
mount | tail -5
sudo findmnt
sudo lsblk
sudo df -h

