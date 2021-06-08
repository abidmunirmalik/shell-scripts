#!/usr/bin/env bash

<< LOOP
# infinite loop with while
[while : or while true same thing]
while true ; do
 echo "while loop"
 sleep 1
done
LOOP

i=1
while [[ $i -lt 5 ]] ; do
  echo $i
  ((i++))
done

<< READ
syntax of reading file:
while read line
do
 statement
done < file_name
READ
echo "[Reading file content with while loop]"
file_name=server.txt
while read line
do
  echo $line
done < $file_name


echo "[Reading command output  with while loop]"
ls -l *.log | awk '{print $NF}' | while read logfile
do 
 sudo du -sh $logfile
done

<< IFS
Internal Field Separator
IFS is shell or environment variables
IFS variable is used as word separator (token) for the loops
By default, IFS is space
Best practice is to reset IFS to its originral value
IFS
ORIGINAL_IFS=$IFS
cat users.txt | awk 'NR != 1 {print $0}' | while IFS="," read uid uname upassword ushell; do
  echo "$uname - $ushell"
done
IFS=$ORIGINAL_IFS
