#!/usr/bin/env bash
set -e

: """
set command is used to debug bash script
Syntax:
  set [options]
set -n = No Execution, Purely for syntax checking
set -x = Prints the commands before executing it in the script
set -e = Exit the script if any of the commands fails

Note: Best practice is comment out 'set -n' on top of the script and
enable it only to find the syntax error
"""
# set -n
echo "This line will not print if \'set -n\' is enabled."
# set -x
date
hostname
wrongcommand
pwd
