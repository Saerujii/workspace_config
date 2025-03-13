#!/bin/bash


if [ -e "./mvnrun.sh" ]; then
    source "./mvnrun.sh";
else
    JAR="php-to-java-1.0-SNAPSHOT.jar";
    MAIN="com.phpToJava.Main";
fi

echo
echo "-------------------------------"
java -cp "$(mvn dependency:build-classpath -q -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout)":target/"$JAR" "$MAIN"
echo "-------------------------------"
echo
