#!/usr/bin/env bash
#
# To decorate output, use printf
# By default no new-line character in printf, so use \n
printf "[printf command]\n"

# print 50 dashes
printf "%50s\n" " " | tr " " "-"

<< COMMENT
Format   Description
%d       For signed decimal numbers
%f       For float decimal numbers
%s       For string
N        Specifies width of the field
*        Placeholder for width
-        Left align output in the field
0        Pad result with leading 0s
+        To put + sign before positive number and - to negative
COMMENT
name="Abid Malik"
x=10
y=5.8
printf "Name: %s Age:%d  Height:%f\n" "$name" "$x" "$y"

echo "[print name, age, height 10 places apart"
printf "Name%10sAge%10sHeight\n"
printf "%s%010d%10.2f\n" "$name" "$x" "$y"

title="Git installation via shell script"
COLUMNS=$(tput cols)
title_size=${#title}
span=$((($COLUMNS + $title_size) /2))

printf "%${COLUMNS}s" " " | tr " " "*"
printf "%${span}s\n" "$title"
printf "%${COLUMNS}s" " " | tr " " "*"
