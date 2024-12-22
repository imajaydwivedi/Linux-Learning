#!/bin/bash
# Description:

echo "Enter your number: "
read num1

#if (( $num1 % 2 == 0 ))
if [ $(expr $num1 % 2) -eq 0 ]
then echo "$num1 is an even number"
else echo "$num1 is an odd number"
fi
