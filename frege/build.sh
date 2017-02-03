#!/usr/bin/env bash

if [ "$1" == "run" ] 
then
  java -cp build Main
  exit
fi

if [ "$1" == "clean" ]
then
  rm -r build/*
  exit
fi

for fregeFile in *.fr
do
  echo "building: $fregeFile"
  java -Xss1m -jar fregec.jar -d build -target 1.7 $fregeFile
done

for javaFile in *.java
do
  echo "building: $javaFile"
  javac -cp build -d build $javaFile
done
