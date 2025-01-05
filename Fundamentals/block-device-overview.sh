:<<'COMMENTS'

Common Linux Block Device Overview
----------------------------------

To address disks, Linux provides devices files in /dev

/dev/sda    -> First SCSI hard disk
/dev/sdb    -> Second SCSI hard disk
/dev/vda    -> KVM hard disk
/dev/nvme0n1 -> First NVME hard disk
/dev/sr0    -> Optical drive

*****************************************************************************************
*****************************************************************************************


# Get lsblk output in PrettyTable format

lsblk -o NAME,MAJ:MIN,RM,SIZE,RO,TYPE,MOUNTPOINTS | \
awk 'NR==1 {printf "+--------+--------+----+------+----+------+------------+\n"; 
            printf "| %-6s | %-6s | %-2s | %-4s | %-2s | %-4s | %-10s |\n", $1, $2, $3, $4, $5, $6, $7; 
            printf "+--------+--------+----+------+----+------+------------+\n"}
     NR>1  {printf "| %-6s | %-6s | %-2s | %-4s | %-2s | %-4s | %-10s |\n", $1, $2, $3, $4, $5, $6, $7} 
     END   {printf "+--------+--------+----+------+----+------+------------+\n"}'


'COMMENTS'

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




