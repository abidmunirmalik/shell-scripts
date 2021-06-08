#!/usr/bin/env bash
#
# Translate lower case to upper case
echo "[upper to lower]"
tr '[:upper:]' '[:lower:]' < xyz.txt
echo "[lower to upper]"
tr '[a-z]' '[A-Z]' < xyz.txt

# Replace 'space' with '-'
echo "[Replace space with -]"
cat xyz.txt | tr " " "-"

# Delete a character
echo "[Docker Version]"
docker -v | cut -d " " -f 3 | tr "," " " | xargs

# Delete () from (running)
Status="(running)"
echo "Actual Status: $Status"
echo "Formatted Status: $(echo $Status | tr -d "[()]")"
