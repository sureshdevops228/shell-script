#1/bin/bash

echo "Please Enter the Number :: "

read -s NUMBER #the value entered above will be automatically atteched to USERNAME variable

if [ $NUMBER -gt 100 ]
then
echo "Given Number $NUMBER is greater than 100"
else
echo "Given Number $NUMBER is not greater than 100"
fi

#$NUMBER -gt 100
#$NUMBER -lt 100
#$NUMBER -ge 100
#$NUMBER -le 100