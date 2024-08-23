#!/bin/bash

if [ $# -eq 0 ]
   then
	printf "Error"
	exit 1
fi


read value


for i in "$@"; do
	echo $i
done
echo $value
