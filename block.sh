#!/usr/bin/env bash
#
<<BLOCK
{} means execute all commands within {} together but independentaly
BLOCK
which docker && { echo "Docker is installed" ; echo "Docker version: $(docker -v)" ; }
which dockerr && { ls ; hostname ; } || echo "something went wrong"
