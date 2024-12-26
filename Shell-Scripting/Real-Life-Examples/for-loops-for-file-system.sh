#!/bin/bash

for i in {1..10}
do
    #echo " : $i"
    if ((i % 2 == 0)); then
    #if [ $((i % 2)) -eq 0 ]; then
        echo "$i is even"
    else
        echo "$i is odd"
    fi
done
