#!/bin/bash

name=$1
first=$2
end=$3


for i in $(eval echo {$first..$end});
do
	mkdir name$i
done
