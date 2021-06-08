#!/usr/bin/env bash
#
<<COMMENT
A non-zero 1-255 exit status means commad was not successful
$? is command-exit status
0 means command was successful
COMMENT
STATUS=$(systemctl status docker | awk '/Active:/' |xargs | awk '{print $2}' | grep "active")
if [[ $STATUS -eq 0 ]]; then
  echo "Docker is running"
else
 echo "Docker is not running"
fi
