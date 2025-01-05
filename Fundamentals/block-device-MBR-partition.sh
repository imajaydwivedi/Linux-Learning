:<<'COMMENTS'

In order to create disk partitions, we have 2 systems - MBR & GPT

Understanding MBR Partitions
-----------------------------

Master Boot Record (MBR) is the old solution for addressing disks

It was introduced in 1981, together with the original PC standard

In MBR, a maximum of 4 partitions can be written to the 512 bytes boot sector

To address beyond 4 partitions, 3 are configured as primary, and 1 is configured as extended partition

Extended partitions can only be used to include logical partitions

The first logical partition is always numbered as partition #5

"fdisk" is the most important utility to create MBR partitions

# Get Help on fdisk
tldr fdisk

  - List partitions:
    sudo fdisk -l

  - Start the partition manipulator:
    sudo fdisk /dev/sdX

  - Once partitioning a disk, create a partition:
    n

  - Once partitioning a disk, select a partition to delete:
    d

  - Once partitioning a disk, view the partition table:
    p

  - Once partitioning a disk, write the changes made:
    w

  - Once partitioning a disk, discard the changes made:
    q

  - Once partitioning a disk, open a help menu:
    m

COMMENTS

# Get block devices using lsblk

+--------+--------+----+------+----+------+------------+
| NAME   | MAJ:MIN| RM | SIZE | RO | TYPE | MOUNTPOINTS |
+--------+--------+----+------+----+------+------------+
| sr0    | 11:0   | 1  | 1024M| 0  | rom  |            |
| zram0  | 251:0  | 0  | 7.7G | 0  | disk | [SWAP]     |
| vda    | 252:0  | 0  | 200G | 0  | disk |            |
| ├─vda1 | 252:1  | 0  | 1M   | 0  | part |            |
| ├─vda2 | 252:2  | 0  | 1G   | 0  | part | /boot      |
| └─vda3 | 252:3  | 0  | 199G | 0  | part | /home      |
|        |        |    |      |    |      | /          |
| vdb    | 252:16 | 0  | 300G | 0  | disk |            |
| vdc    | 252:32 | 0  | 20G  | 0  | disk |            |
| vdd    | 252:48 | 0  | 15G  | 0  | disk |            |
| vde    | 252:64 | 0  | 20G  | 0  | disk |            |
+--------+--------+----+------+----+------+------------+

# notice that MOUNTPOINTS is empty for many devices

# create partition for vdb device
sudo fdisk /dev/vdb