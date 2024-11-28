# Define the build argument with a default value
ARG ROS_VERSION=${ROS_VERSION}

# Conditionally set the base image based on the argument
FROM docker.io/ros:${ROS_VERSION}

ENV SHELL /bin/bash
# # Install sudo
RUN <<EOF
apt-get update 
apt-get install -y sudo openssh-client rsyslog python3-pip
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

## Install additional softwares
RUN <<EOF
apt-get update 
apt-get install -y icewm tmux xclip
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF


RUN <<EOF
apt-get update 
apt-get install -y ros-${ROS_VERSION}-rmw-cyclonedds-cpp
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF

COPY <<EOF /post-create-script.sh
#!/bin/bash
bash /workspace/.scripts/print_packages.bash
EOF

RUN chmod +x /post-create-script.sh

# [Optional] Set the default user. Omit if you want to keep the default as root.
# USER $USERNAME
CMD ["/bin/bash"]