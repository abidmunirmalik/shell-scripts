#!/usr/bin/env bash

# The 'cut' is based on 'Byte position' or 'characger position' or 'fields delimiter'
# By default delimiter is 'Tab'
# cut -b or -c or -f where b and c are byte and character

# Exercise 1: print 1st and 7th field from /etc/passwd file
echo "[logins and their shells]"
cut -d ":" -f 1,7 /etc/passwd --output-delimiter=" "

# Exercise 2: only print lines where delimiter is space
echo "[ignoring all other delimiters except space]"
cut -d ' ' -s -f 1,2 xyz.txt
