#!/usr/bin/env bash

# if executing command, don't use [[ ]]
if which docker 2>/dev/null 1>/dev/null ; then
  echo "Docker is installed on this host"
  echo "$(docker -v)"
fi

# if comparing, use [[ ]] or [ ]
which docker 2>/dev/null 1>/dev/null
if [[ $? -eq 0 ]]; then
  echo "Docker is installed on this host"
  echo "$(docker -v)"
fi

<<COMMENT
cmd1 && cmd2 || cmd3
it means run cmd2 if cmd1 succeed, otherwise run cmd3
Above can be written as
if cmd1 ; then
  cmd2
else
 cmd3
fi
[[ are improved version of [
with [[ we don't need to put quotes around variables
[[ $name = abid ]] instead of [[ "$name" = "abid" ]]
COMMENT
which jenkins 2>/dev/null 1>/dev/null
if [[ $? -eq 0 ]]; then
  echo "Jenkins is installed on this host"
  echo "$(jenkins --version)"
else
  echo "Jenkins is not installed"
fi

# Excercise: Check if user is root and have sudo access
uid=$(id -u)

if [[ $uid -eq 0 ]]; then
 echo "You are root"
else
 echo "You are not root"
fi
# Or in one line, we can write
[[ $(id -u) -eq 0 ]] && echo "You are root" || echo "You are not root"
sudo -v 2>/dev/null 1>/dev/null && echo "$(id -un) have sudo privileges" || echo "$(id -un) don't have sudo privileges"

# Start service if not started
if systemctl status docker 1>/dev/null 2>/dev/null ; then
 echo "Docker already running on $(hostname)"
else
 sudo systemctl start docker.service
 echo "Service started"
fi

# Logical operators
read -p "Enter any number: " num
if [[ $num -gt 10 && $num -le 100 ]] ; then 
 echo "Number is greater than 10 and less than 100" 
else
 echo "$num less than 10"
fi

# Using tilda
read -p "press yes or y: " 
if [[ $REPLY =~ yes|y ]]; then
  echo "user pressed y or yes"
else
  echo "user didn't press y or yes"
fi

# using (())
echo "Use (()) if you want to use symbols like <, >"
x=40
y=90
((x>y)) && echo "x > y" || echo "x < y"
[[ $x -gt $y ]] && echo "x > y" || echo "x < y"

# if elif else example
read -p "Enter option: " option
if [[ $option == start ]] ; then
	echo "Starting..."
	systemctl start docker
elif [[ $option == stop ]]; then
	echo "Stopping..."
	systemctl stop docker
elif [[ $option == status ]]; then
	echo "Status..."
	systemctl status docker | grep "Active:"
else
	echo "invalid option"
	echo "valid options start|start|status"
fi
