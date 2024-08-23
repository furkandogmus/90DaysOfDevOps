#!/bin/bash


if [ -z "$1" ] || [ -z "$2" ]
 then
	 echo "Please write two number for comparison."
	 exit 1
fi

if [ $1 -eq $2 ]
then 
	echo "$1 = $2"
elif [ $1 -gt $2 ]
then
	echo "$1 > $2"
else
	echo "$1 < $2"
fi


