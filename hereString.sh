#!/usr/bin/env bash
#
# here string is one liner only
# Syntax: command <<< string
# 
# Excercise: convert lower to upper case using hereString
echo "[Lower case to upper using hereString]"
tr '[a-z]' '[A-Z]' <<< "my name is abid malik"

echo ""

echo "[Using variable, convert lower case to upper using hereString]"
myName="Abid Malik"
tr '[a-z]' '[A-Z]' <<< $myName

echo ""

echo "[Using command-output, convert lower case to upper using hereString]"
tr '[a-z]' '[A-Z]' <<< $(hostname)
