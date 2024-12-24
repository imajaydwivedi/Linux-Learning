#!/bin/bash

# Create backdated files for testing
letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
counter=0
for letter in ${letters[@]}
do
    # Access array by index (arrays are zero-indexed, so subtract 1 from counter)
    file_path="/tmp/dba_test_${letters[$counter]}.log"

    touch -d "$counter weeks ago" $file_path

    counter=$((counter+1))
done

echo
echo "Get all the files created in /tmp/ directory."
ls -lt /tmp/*test*.log
echo