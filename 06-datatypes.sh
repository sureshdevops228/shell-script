#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum is:: $SUM"

echo "How many args are passed:: $#"

echo "What all args we will get:: $@"

echo "Script name is:: $0"