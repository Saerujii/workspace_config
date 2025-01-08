#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: maventest <TestClassName>"
  exit 1
fi

# Run the Java command with the provided argument
# mvn package | rg "time" # Add argument for optional packaging
echo
echo "-------------------------------"
java -cp "$(mvn dependency:build-classpath -q -DincludeScope=runtime -Dmdep.outputFile=/dev/stdout)":target/test-classes:/home/saeru/Desktop/DAW2/Java/php-to-java/target/classes com.phpToJava."$1"
echo "-------------------------------"
echo
