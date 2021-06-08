#!/usr/bin/env bash
#
# awk [options] '{action}' input-file
#
# default variables in awk:
# $0 - Entire file
# $1 - First field from each line
# $2 - 2nd field from each line
# NR - print line number i.e awk '{print NR,$0}' file.name
# NF - how many fields per line i.e awk '{print NR,$0,NF}' file.name
# $NF- print last field from each line i.e awk '{print NR,$NF}' httpd.version 
# 
# cat httpd.version
# Server version: Apache/2.4.41 ()
# Server built:   Oct 22 2019 22:59:04
# 
# Exercise: print 2.4.41 from httpd.version
echo "[httpd version]"
cat httpd.version | grep -iE "VERSION" | awk -F '[ /]' '{print $4}'
# -F [ /] means delimiter is either a space or /
