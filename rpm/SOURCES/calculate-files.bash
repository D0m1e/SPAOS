#!/bin/bash

# Path to the directory
DIR="/etc"

# Find files excluding directories and links, and count them
file_count=$(find "$DIR" -type f | wc -l)

# Display the result
echo "The number of files in $DIR (excluding directories and links): $file_count"
