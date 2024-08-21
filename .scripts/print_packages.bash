#!/bin/bash

# Check if the check_pkgs.txt file exists
if [ ! -f "/workspace/.scripts/check_pkgs.txt" ]; then
    echo "File check_pkgs.txt not found!"
    exit 1
fi

# Run dpkg --list and filter with the package names from check_pkgs.txt
dpkg --list | grep -Ff /workspace/.scripts/check_pkgs.txt | awk '
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