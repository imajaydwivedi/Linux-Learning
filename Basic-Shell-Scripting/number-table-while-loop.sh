#!/bin/bash
echo
echo Enter a number
read num
echo

counter=0
while [ $counter -lt 10 ]
do
  echo $counter
  counter=`expr $counter + 1`
done

echo