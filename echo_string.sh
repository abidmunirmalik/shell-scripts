#!/usr/bin/env bash
#
# printing two lines with one echo command
echo -e "This is first line.\nThis is second line"

# printing horizontal tab
echo -e "Name\tAge"

# print next line in same line
# -n option will not let cursor go to next line
echo -n "My name: "
echo "Abid Malik"
# The -n option only applied to one next line

echo "Next line"

# Printing output in colors
#
# Reset Text Color
  # Color_Off='\033[0m'

# Regular Colors
  # Black='\033[0;30m'
  # Red='\033[0;31m'
  # Green='\033[0;32m'
  # Yellow='\033[0;33m'
  # Blue='\033[0;34m'
  # Purple='\033[0;35m'
  # Cyan='\033[0;36m'
  # White='\033[0;37m'

# Bold Colors
  # BBlack='\033[1;30m'
  # BRed='\033[1;31m'
  # BGreen='\033[1;32m'
  
