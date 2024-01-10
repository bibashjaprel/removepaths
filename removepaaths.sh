#!/bin/bash

# Function to display usage information
display_help() {
    echo "Usage: $0 <file_containing_paths>"
    echo "Description: This script deletes files or directories listed in a text file."
    echo "Options:"
    echo "  -h, --help      Display this help message and exit"
}


# Check if help option is provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    display_help
    exit 0
fi


# Check if a file containing paths is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_containing_paths>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File '$file' not found."
    exit 1
fi

# Read each line in the file and delete the corresponding path
while IFS= read -r line; do
    if [ -e "$line" ]; then
        echo "Deleting: $line"
        rm -rf "$line"
        echo "Deleted: $line"
    else
        echo "Path '$line' does not exist."
    fi
done < "$file"

echo "Deletion process completed."
