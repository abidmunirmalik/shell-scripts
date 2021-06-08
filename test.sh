#!/usr/bin/env bash
# test = check file types and compare values
<<TEST
The syntax of 'test' command:
 test condition or [condition] or [[condition]]
Note: we have to create this condition like if two numbers are equal or if file exists etc
Comparison Operators for Numbers:
[[ int1 -eq int2 ]] -- true if int1 is equal to int2 else false
[[ int1 -ne int2 ]] -- true if int1 is not equal to int2 else false
[[ int1 -lt int2 ]] -- true if int1 is less than int2 else false
[[ int1 -gt int2 ]] -- true if int1 is greater to int2 else false
[[ int1 -ge int2 ]] -- true if int1 is greater or equal to int2 else false
[[ ! int1 -eq int2 ]] -- reverse 

Comparison Operators for Strings:
[[ -z str ]] -- true if length of str is zero
[[ -n str ]] -- true if length is non-zero
[[ str1 == str2 ]] -- true if both strings are equal else false
[[ str1 != str2 ]] -- true if both strings are not equal

File Operators
[[ -d file ]] -- true if file exists and is a directory
[[ -f file ]] -- true if file exists and is a file
[[ -e file ]] -- true if the file/path exists
[[ -r file ]] -- true if file is readable
[[ -w file ]] -- true if file is writeable
[[ -x file ]] -- true if file is executable

Logical Operators
cmd1 ; cmd2 -- Run cmd1 and then cmd2 regardless if cmd1 succeed or fail
cmd1 && cmd2 -- Run cmd2 only if cmd1 succeed
cmd1 || cmd2 -- Run cmd2 only if cmd1 fail
cmd1 && cmd2 || cmd3 -- Run cmd2 if cmd1 suceed else if cmd1 failes, then run cmd3
TEST


test -d demo
echo "status: $?"
[ -d demo ]
echo "status []: $?"
[[ -d demoo ]]
echo "status [[]]: $?"

echo "[test command with if statement]"
if [[ -d demo ]]; then
  echo "demo exists and is directory"
else
  echo "demo does not exists"
fi

echo "[test if file is exectable]"
if [[ -f abid.sh ]] && [[ -x abid.sh ]]; then
 echo "abid.sh exists and exectuable"
else
  echo "not executable or does not exists"
fi

echo "[print message only when Jenkins is not installed]"
which jenkins  2>/dev/null || echo "No Jenkins"
which docker 2>/dev/null || echo "No Docker"

echo "[run cmd2 if cmd1 succeed otherwise run cmd3]"
which docker 2>/dev/null && echo "Docker installed" || echo "Docker is not installed"
