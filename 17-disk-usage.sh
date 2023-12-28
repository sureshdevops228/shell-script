#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=" "


while IFS= read line
do
    usage=$(echo $line  | awk '{print $6F}' | cut % -f1 )
    partition=$(echo $line | awk '{print $6F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High Disk Usage on $partition : $usage \n"

done <<< $DISK_USAGE 

echo -e "message :: $message"