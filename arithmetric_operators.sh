#!/usr/bin/env bash
#
<<COMMENTS
Shell script variables are by default treated as 'strings', not 'numbers'
This adds some complexity doing math operators on them.
There are different ways to perform arithmetic operations:
 - declare
 - expr
 - let
 - (()) for integers
 - bc for integers and float numbers
COMMENTS
echo "[Arithmatic operations on 14 and 5]"
x=14
y=5

(( sum = x + y ))
(( dif = x - y ))
(( mul = x * y ))
(( div = x / y ))
(( rem = x % y ))

echo "Sum: $sum"
echo "Difference: $dif"
echo "Multiplication: $mul"
echo "Division: $div"
echo "Remainder: $rem"

echo "inrement of 1 to x"
((x++))
echo "$x"

echo "[bash calculator bc for floating]"
bc<<<"3.4 + 4"
