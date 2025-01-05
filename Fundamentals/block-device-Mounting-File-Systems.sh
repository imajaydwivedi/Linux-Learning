:<<'COMMENTS'

Mounting File System
--------------------

To use a partition containing a file system, it must be mounted.

By mounting a partition, it is connected to a directory.

While writing to a directory that contains a mounted parition, writes are
  actually committed to the mounted device

When the connected device is unmounted, you won't see the files that are written anymore.

Notice that mounting is also required for devices like DVD or CD-ROM

Use "mount" to mount a device for temporary basis
    mount /dev/sdb1 /mnt

Use "umount" to disconnect a mounted device
    umount /mnt

If while unmounting, the message "device is busy" appears, use "lsof" to find
  out which processes are keeping the device busy

To verify current mounts
    - mount
    - lsblk
    - df -h
    - findmnt


COMMENTS

# mount /dev/vdb1
sudo mount /dev/vdb1 /mnt
lsblk

# unmount the mounted directory
sudo umount /mnt

# if device busy error
lsof /mnt






