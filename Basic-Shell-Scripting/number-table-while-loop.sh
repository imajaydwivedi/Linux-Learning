#!/bin/bash
echo
echo Enter a number
read num
echo

counter=1
#while [ $counter -le 10 ]
while (( counter <= 10))
do
  echo "$num * $counter = $((num * counter))"
  counter=`expr $counter + 1`
done

echo

: <<'COMMENT'

$(( counter <= 10 )) ==> Arithmetic "Expansion" => Evaluate an expression and return its Value

(( counter <= 10 )) ==> Arithmetic "Evaluation" => Evaluate an expression as a condition. Returns exit status (0=true, 1=false)

COMMENT

