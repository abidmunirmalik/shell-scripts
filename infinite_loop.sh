#!/usr/bin/env bash
: """
The script runs an infinite loop
It will sleep for 30 sec and run date command
The output accumilated into a log file
"""
for((;;)); do
 sed -i '$!d' /home/amalik/nethome/shell-scripts/infinite_loop.log
 date >> /home/amalik/nethome/shell-scripts/infinite_loop.log
 sleep 30
done
