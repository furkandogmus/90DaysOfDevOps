#!/bin/bash

# Set IFS to newline to read each line separately
IFS=$'\n'

# Read a file line by line
while read -r line; do
    echo "$line"
done < "file.txt"
