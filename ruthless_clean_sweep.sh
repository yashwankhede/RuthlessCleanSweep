#!/bin/bash

# Function to delete empty directories and files recursively
delete_empty() {
    local dir=$1

    # Find and delete empty files
    find "$dir" -type f -empty -delete

    # Find and delete empty directories
    find "$dir" -type d -empty -delete
}

# Call the function with the current directory
delete_empty "$(pwd)"

echo "Empty files and directories deleted successfully."
