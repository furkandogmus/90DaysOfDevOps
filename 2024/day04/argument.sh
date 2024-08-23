#!/bin/bash

if [ $# -eq 0 ]
   then
	printf "Error"
	return 1
fi


read value


for i in "$@"; do
	echo $i
done
echo $value
