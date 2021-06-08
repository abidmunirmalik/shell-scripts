#!/usr/bin/env bash
#
# Length of string
name="Abid Munir Malik"
echo "[Length of Abid Munir Malik]"
echo ${#name}

# String concatenation
rootPath="/etc/"
filePath="os-release"
echo "[content of file /etc/os-release]"
cat ${rootPath}${filePath}

# String to upper
echo "[abid string in upper case]"
name="abid"
echo "${name^^}"

# String to lower
echo "[ABID string in lower case]"
name="ABID"
echo "${name,,}"

# Replce string
echo "[Replace Abid Malik with Abid M. Malik]"
name="Abid Malik"
echo "${name/Abid/Abid M.}"


# Slice the string
# syntax: ${string:start_position:length}
name="Abid Malik"
echo "[From Abid Malik, pick Malik]"
echo "${name:5:6}"
echo "from 5th character to the end"
echo "${name:5}"

# Strings Paths
: """
realpath = Converts each filename argument to an absolute pathname but does not validate the path
basename = it stripts out the file name from complete path
dirname  = It will delete any suffix beginning with the last slash characger and return result
"""
echo "[Complete path of strings.sh file]"
realpath strings.sh

echo "[file name from /nethome/scratch/shell-scripts/strings.sh]"
basename "/home/amalik/nethome/scratch/shell-scripts/strings.sh"

echo "[Remove extension from file name]"
basename "/home/amalik/nethome/scratch/shell-scripts/strings.sh" .sh

echo "[directory name]"
dirname /home/amalik/nethome/scratch/shell-scripts/strings.sh

