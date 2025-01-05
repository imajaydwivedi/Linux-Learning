:<<'COMMENTS'

Creating File Systems
---------------------

To use a partition, a file system must be created on top of it.

File systems are used to store files, but there are also special-purpose file systems
  that can be created on a partition.

Swapfs is a swap file system

Initramfs is a file system that is written to the Init RAM FS, which is used while booting

Generic file systems are XFS and Ext4

Use "mkfs.xfs" or "mkfs.ext4" to create these file systems.

There is no need to use file systems like vfat or NTFS, unless for formatting USB thumb drives

COMMENTS

# Get block devices
lsblk --output NAME,TYPE,SIZE,FSTYPE,LABEL,FSAVAIL,MOUNTPOINTS

+-------+------+-------+-------+--------+---------+------------+
| NAME  | TYPE | SIZE  | FSTYPE| LABEL  | FSAVAIL | MOUNTPOINTS |
+-------+------+-------+-------+--------+---------+------------+
| sr0   | rom  | 1024M |       |        |         |            |
| zram0 | disk | 7.7G  |       |        |         | [SWAP]     |
| vda   | disk | 200G  |       |        |         |            |
| ├─vda1| part | 1M    |       |        |         |            |
| ├─vda2| part | 1G    | ext4  |        | 584.7M  | /boot      |
| └─vda3| part | 199G  | btrfs | fedora | 193.2G  | /home      |
|       |      |       |       |        |         | /          |
| vdb   | disk | 300G  |       |        |         |            |
| └─vdb1| part | 5G    | ext4  |        |         |            |
| vdc   | disk | 20G   |       |        |         |            |
| └─vdc1| part | 5G    |       |        |         |            |
| vdd   | disk | 15G   |       |        |         |            |
| vde   | disk | 20G   |       |        |         |            |
+-------+------+-------+-------+--------+---------+------------+


# create file system for a partition
sudo mkfs.ext4 -L disk_5G /dev/vdb1


