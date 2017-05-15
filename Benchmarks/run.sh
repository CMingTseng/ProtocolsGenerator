#!/usr/bin/env bash

filename=$(date +"%d%b%Y_%H:%M")
tar -zcvf "tests/test_$filename.tar.gz" src/ *.xml
echo "SAVE [DONE]"

path="tests/test_$filename.txt"

echo "INDY: [START]"

echo "INDY:" >> $path
mvn -f indy_pom.xml clean install
java -jar target/benchmarks.jar SingleRun.* -wi 20 -i 20 -f 1 -t 1 >> $path
java -jar target/benchmarks.jar MultiTarget.* -wi 20 -i 20 -f 1 -t 1 >> $path
java -jar target/benchmarks.jar MergeSort.* -wi 20 -i 20 -f 1 -t 1 >> $path

echo "INDY: [DONE]"

echo "" >> $path

echo "REFLECTION: [START]"

echo "REFLECTION:" >> $path
mvn -f reflection_pom.xml clean install
java -jar target/benchmarks.jar SingleRun.* -wi 20 -i 20 -f 1 -t 1 >> $path
java -jar target/benchmarks.jar MultiTarget.* -wi 20 -i 20 -f 1 -t 1 >> $path
java -jar target/benchmarks.jar MergeSort.* -wi 20 -i 20 -f 1 -t 1 >> $path

echo "REFLECTION: [DONE]"
