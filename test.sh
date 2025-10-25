#!/bin/bash

#echo "script name: $0"

var=$(echo $0 | cut -d "." -f1)
echo "we have implemented new one : $var"
