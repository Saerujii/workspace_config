#!/bin/bash

echo
echo "-------------------------------"
mvn package
echo "-------------------------------"
echo

if [ "$1" == "deploy" ]; then
    mv target/*1.0-SNAPSHOT.war target/"$(basename "$PWD")".war
    sudo mv target/"$(basename "$PWD")".war /usr/share/tomcat10/webapps/
    sudo systemctl restart tomcat10
fi

if [ "$1" == "run" ]; then
    source "$HOME/bashscripts/mavenrun.sh"
fi
