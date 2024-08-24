#!/bin/bash

# URL of the remote file
REMOTE_URL="https://rishikesavanramesh.github.io/files/resources/ROS2-DEV/check_pkgs.txt"

# Temporary file to store the downloaded content
TEMP_FILE=$(mktemp)

# Download the file from the remote URL
if ! curl -s "$REMOTE_URL" -o "$TEMP_FILE"; then
    echo "Failed to download the file from $REMOTE_URL"
    exit 1
fi

# Run dpkg --list and filter with the package names from the downloaded file
dpkg --list | grep -Ff "$TEMP_FILE" | awk '
BEGIN {
    printf "%-50s %-30s %-50s\n", "Package Name", "Version", "Description"
    printf "%-50s %-30s %-50s\n", "-------------", "-------", "-----------"
}
{
    package=$2
    version=$3
    description=$0
    sub(/^[^ ]+ +[^ ]+ +[^ ]+ +/, "", description)
    printf "%-50s %-30s %-50s\n", package, version, description
}
'

# Clean up the temporary file
rm -f "$TEMP_FILE"
