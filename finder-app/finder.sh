#!/bin/bash

# Check if the required arguments were provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required. Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Save the directory path and search string
filesdir="$1"
searchstr="$2"

# Check if the directory exists
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist"
    exit 1
fi

# Search for the string in all files in the directory (not including subdirectories)
numfiles=$(find "$filesdir" -maxdepth 1 -type f | wc -l)
nummatches=$(grep "$searchstr" "$filesdir"/* | wc -l)

# Print the results
echo "The number of files are $numfiles and the number of matching lines are $nummatches"
