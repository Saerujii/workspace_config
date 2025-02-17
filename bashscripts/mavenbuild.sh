#!/bin/bash

echo
echo "-------------------------------"
mvn package
echo "-------------------------------"
echo

if [ "$1" == "run" ]; then
    source "$HOME/bashscripts/mavenrun.sh"
fi
