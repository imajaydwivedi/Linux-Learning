#!/bin/bash

echo
echo Enter number
read num
echo

for counter in {1..10}
#for counter in $(seq 1 10)
#for counter in 1 2 3 4 5 6 7 8 9 10
#for ((counter=1; counter<=10; counter++))
do
  echo "$num * $counter  => $(($num * $counter))"
done

echo


