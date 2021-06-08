#!/usr/bin/env bash

# searching with pattern
# xy|pq Matches for xy or pq i.e grep -E "xy|pq" file
# ^xyz  Matches for the lines which are starting with 'xyz' i.e grep -Ei "^this" file
# xyz$  Matches for the lines which are ending with 'xyz'
# ^$    Matches for the lines which are empty
# \     To remove the special purpose of any symbol i.e grep -E "\^" file
# .     Matches any ONE character i.e grep -E "^t..s" file
# \b    Matches the empty string at the edge of word i.e grep -E "\bthis" file
# ?     Matches optional 0 times or one time i.e grep -E "yf?" file
# *     Matches any number of times i.e grep -E "y*" file
# +     Matches minimum one maximum any number 
# [xyz] Matches lines having either x or y or z i.e 
# [a-d] is equal to [abcd] Matches for lines which are having a or b or c or d
# ^[abc] Matches for lines which are starting with a or b or c i.e grep -E "^[ab]" file
# {N}    The preceeding string matched exactly N time i.e grep -E "f{2}" file
# [[:digit:]] Matches any line that has number in it i.e grep -E "[[:digit:]]" file
# [[:upper:]] Matches any line that has upper case in it i.e grep -E "[[:upper:]]" file
# [[:lower:]] Matches any line that has lower case in it i.e grep -E "[[:lower:]]" file

sudo grep -i -e "Error" -e "Fatal" /var/log/messages 

# same as above but with E
sudo grep -i -E "Error|Warning|Fatal" /var/log/messages | tail -1

# Exercise 1 - Write a pattern to match only 'directories'
echo "List of directories"
ls -l | grep -E "^[d]"

echo "List of files only"
ls -l | grep -E "^[-]"

# Exercise 2 - List valid IPv4 addresses only
echo "valid IP addresses"
grep -E "\b[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\b" server.txt

# Print only selected Filesystem
df -h | grep -vE "tmpfs|udev"
