#!/usr/bin/env bash

# STDIN=0, STDOUT=1, STDERR=2
# output success into success.txt
# output error into error.txt
java -version 2>error.txt 1>success.txt

# Store STDERR i.e 2 in same file where STDOUT i.e 1 is storing
java -version 1>java_version.txt 2>&1

# Or shortcut form 
java -version &> java_version.txt
docker -v &> docker_version.txt
