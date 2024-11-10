#!/bin/bash
echo
echo Please choose on of the options below
echo
echo 'a = Addition'
echo 'b = Subtraction'
echo 'c = Multiplication'
echo 'd = Division'
echo

read choice

echo Enter 1st number
read no1
echo Enter 2nd number
read no2

result=0
case $choice in
a) echo "($no1 + $no2) => $(($no1 + $no2))";;
b) echo "($no1 - $no2) => $(($no1 - $no2))";;
c) echo "($no1 * $no2) => $(($no1 * $no2))";;
d) echo "($no1 / $no2) => $(($no1 / $no2))";;
*) echo "invalid choice";;
esac




