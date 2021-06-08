#!/usr/bin/env bash
#
<<LOOP
Loop Types:
 for loop
 while loop
 until loop
 select loop

Syntax 'for each':
for variable in list_of_variables ; do
  command1
  command2
done

for each in 1 2 3 4 5; do
 echo "Bash Scripting is very powerful"
done

C-Language style 'for loop'
for(( x; condition; increment/decrement)); do
  command1
  command2
done

Example:
for((x=1; x < 6; x++)); do
 echo "value of x: $x"
done

INFINTE LOOP SYNTAX:
for((;;)); do
  command
done

Example:
LOOP
cnt=1
for((;;)); do
  echo "infinite loop $cnt"
  ((cnt++))
  sleep 1
  if [[ $cnt -eq 10 ]]; then
    echo "Getting out of loop now"
    break
  fi
done

# List all executable files in given path
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <path>"
  exit 1
fi
 
if [[ ! -d $1 ]]; then
  echo "$1 does not exists..."
  exit 1
fi

echo "[all executable scripts]"
for file in $(sudo ls -l $1) ; do
 if [[ -x $file ]]; then
   sudo ls -l $file
 fi
done

# break and continue with loop
for s in $(seq 1 10); do
 if [[ $s -lt 5 ]]; then
   continue
 else
   echo -e "The value of \$s is now ${s}"
   break
 fi
done
