#!/bin/bash

# get the output of 'df -h' excluding the header
mapfile -t lines < <(df -h | tail -n +2)

echo "First line: ${lines[0]}"
echo "All lines:"
printf '%s\n' "${lines[@]}"


# expand the array into individual variables
for line in "${lines[@]}"; do
    read -r filesystem size used avail usep mounted <<< "$line"
    echo "Filesystem: $filesystem"
    echo "Size: $size"
    echo "Used: $used"
    echo "Available: $avail"
    echo "Use%: $usep"
    echo "Mounted on: $mounted"
    echo "--------------------------"
done


# Loop through each line of 'df -h' excluding the header
df -h | tail -n +2 | while read -r filesystem size used avail usep mounted; do
    # printf "%-20s %-8s %-8s %-8s %-5s %-10s\n" "$filesystem" "$size" "$used" "$avail" "$usep" "$mounted"
    echo "Filesystem: $filesystem"
    echo "Size: $size"
    echo "Used: $used"
    echo "Available: $avail"
    echo "Use%: $usep"
    echo "Mounted on: $mounted"
    echo "--------------------------"
done

