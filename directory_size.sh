#!/usr/bin/env bash
<< SCRIPT
Author:  Abid Malik <abid.malik@cengage.com>
Created: Feburary 08, 2021
Purpose: To list top 5 most-space-used directories
SCRIPT

# Exit out if command-line argument is not specified
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <directory_path>"
  exit 1
fi

# Exit out if provided path does not exist
if [[ ! -d $1 ]]; then
  echo "$1 doesn't exists"
  exit 1
fi

if [[ $1 == / ]]; then
  echo "/ is not allowed" 
  exit 1
else
 sudo du -h --max-depth=1 $1 | sort  -rh | head -5
fi
