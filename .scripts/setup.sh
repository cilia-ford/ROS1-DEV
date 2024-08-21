#!/bin/bash
set -e

# Define ROS_DISTRO if not already set
: "${ROS_DISTRO:?ROS_DISTRO environment variable must be set}"

# Import VCS repositories
echo "Importing repositories from src/ros2.repos..."
vcs import < src/ros2.repos src

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Remove the obsolete rosdep sources file and initialize rosdep if necessary
ROSDEP_FILE="/etc/ros/rosdep/sources.list.d/20-default.list"
if [ -f "$ROSDEP_FILE" ]; then
    echo "Removing obsolete rosdep sources file: $ROSDEP_FILE..."
    sudo rm "$ROSDEP_FILE"
fi

echo "Initializing rosdep..."
sudo rosdep init

# Update rosdep database
echo "Updating rosdep database for ROS distro $ROS_DISTRO..."
rosdep update --rosdistro="$ROS_DISTRO" 

# Install dependencies
echo "Installing dependencies from source paths..."
rosdep install --from-paths src --ignore-src -y --rosdistro="$ROS_DISTRO"

echo "Setup complete!"
