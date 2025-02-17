#!/bin/bash

echo
echo "-------------------------------"
java -cp $(mvn dependency:build-classpath -q -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout):target/php-to-java-1.0-SNAPSHOT.jar com.phpToJava.Main
echo "-------------------------------"
echo
