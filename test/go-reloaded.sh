#!/bin/bash

cases=("." ".a" "(cap," "(bin,2)")

for test in "${cases[@]}"
do
    echo "$test" > sample.txt
    go run . sample.txt result.txt
done