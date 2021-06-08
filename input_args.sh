#!/usr/bin/env bash
#
# 'read' command is used to take input from user
# If we don't mention variable name, default is REPLY
read -p "Your Name: " 
echo "You entered your name as: ${REPLY}"

# Command line arguments or Positional arguments
: '''
There are provided on at the command prompt
First argument is $1, second one is $2, and so on
Total number of arguments are represented by #$
'''
if [[ ${#} -eq 0 ]]; then
 echo "No command-line arguments provided"
 exit 100
else
 echo "[Total Command-line argument provided]"
 echo ${#}
 echo "[All command-line arguments]"
 echo ${@}
fi
