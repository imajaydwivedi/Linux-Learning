:<<'COMMENTS'

Understanding GPT
-----------------

GPT has been used since approximately 2010

In GPT, a maximum of 128 partitions can be created

GPT is required on disks bigger than 2 TB

"gdisk" is the most important utility to create GPT partitions

# Get help on gdisk


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

#
sudo gdisk /dev/vdc

