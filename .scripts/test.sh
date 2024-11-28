#!/bin/bash
set -e

source /opt/ros/$ROS_DISTRO/setup.bash

if [ -f install/setup.bash ]; then source install/setup.bash; fi
colcon test --merge-install
colcon test-result --verbose