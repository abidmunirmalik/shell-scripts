#!/usr/bin/env bash

# This will print from line 5 to line 10

echo "using awk"
awk 'NR>=5 && NR<=10 {print}' xyz.txt

echo "------------"
echo "using head and tail"
head -10 xyz.txt | tail -6

echo "-------------"
echo "using sed"
sed -n '5,10p' xyz.txt
