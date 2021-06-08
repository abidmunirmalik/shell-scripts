#!/usr/bin/env bash

echo "select a task: "
select TASK in 'Check mounts' 'Check disk space' 'Check Memory usage' 'Exit'
do
case $REPLY in
     1) mount ;;
     2) df -h ;;
     3) free -m ;;
     4) exit 0 ;;
     *) echo ERROR && exit 2 ;;
esac
done
