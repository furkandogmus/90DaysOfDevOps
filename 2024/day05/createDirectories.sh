#!/bin/bash

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
	echo "Please enter 3 arguments sequentially directory names, the first number and the second number."
	exit 1
fi

eval mkdir $1{$2..$3}
