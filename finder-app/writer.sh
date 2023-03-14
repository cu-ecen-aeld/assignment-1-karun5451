#!/bin/bash

# Check if the required arguments were provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required. Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Save the file path and content
writefile="$1"
writestr="$2"

# Extract the directory path
dirpath="$(dirname "$writefile")"

# Check if the directory exists and create it if it doesn't
if [ ! -d "$dirpath" ]; then
    echo "Directory $dirpath does not exist. Creating it..."
    mkdir -p "$dirpath"
fi

# Check if the file exists, create it if it doesn't
if [ ! -e "$writefile" ]; then
    echo "File $writefile does not exist. Creating it now."
    touch "$writefile"
fi

# Check if the file was created successfully
if [ ! -f "$writefile" ]; then
    echo "Error: $writefile could not be created"
    exit 1
fi


# Create the file with the given content
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file $writefile"
    exit 1
fi

# Print a success message
echo "File $writefile created successfully with content:"
echo "$writestr"
