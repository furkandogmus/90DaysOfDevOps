#!/bin/bash

list="one:two:three"

# Set IFS to colon
IFS=':'

# Loop through the list
for item in $list; do
    echo "$item"
done

