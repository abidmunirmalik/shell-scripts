#!/usr/bin/env bash
#
# There are two types of variables
#
# System variables: Managed by operating system
# System variable are generally defined in CAPITAL LETTERS
# We can view system variables by 'set' command
# Examples are HOME, BASH, USER, PWD etc
#
# User-Defined variables: Created by end users
# Naming should contain only lower, upper, under-score
# Variable lenght should be less than 20 characters
# Variables are case-senstive
# There should be "no space" when defining variables
# No need to declare variable type
# Use quotes when variable value contains spaces
# Output of a command can be stored in variable
# todayDate=$(date) or todayDate=`date`
# One variable can be assigned to other variable
# Name="Abid Malik"
# myName=$Name or myName=${Name}

# Excercise: Find status and version of argument service
echo "[Status and version of docker]"
Status=$(systemctl status docker | awk '/Active:/ {print $2,$3}')
Version=$(docker -v | awk '{print $3}' | tr -d ",")
echo "Docker Service Status: $Status"
echo "Docker Version: $Version"
