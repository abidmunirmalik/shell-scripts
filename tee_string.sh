#!/usr/bin/env bash
#
# tee command is used to display the output and also to store that output into a file.
# It does both the tasks simultaneously
# It is useful to create log files for shell scripting
#
# Syntax: Command | tee outputFile.log
#
# Exercise: save result in file and ALSO show output on screen
echo "[Output to screen + saving in file]"
date | tee output.log

# Exercise: Append log to file
echo "[Appending to log file]"
uptime | xargs | tee -a output.log

