#!/bin/bash

string="apple,banana,orange"

# Set IFS to comma
IFS=','

# Read the string into an array
read -ra fruits <<< "$string"

# Print each element of the array
for fruit in "${fruits[@]}"; do
    echo "$fruit"
done



#!/bin/bash

# Save original IFS
OLDIFS=$IFS

# Set IFS to colon
IFS=':'

# Your code here

# Restore IFS
IFS=$OLDIFS

