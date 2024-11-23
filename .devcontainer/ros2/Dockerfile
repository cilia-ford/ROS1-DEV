# FROM docker.io/eprosima/vulcanexus:humble-desktop
FROM docker.io/ros:humble

# # Install sudo
RUN <<EOF
apt-get update 
apt-get install -y sudo openssh-client rsyslog
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
apt-get install -y ros-humble-rmw-cyclonedds-cpp
apt-get clean
rm -rf /var/lib/apt/lists/*
EOF


# Create a non-root user called "developer" with sudo privileges
RUN <<EOF
useradd -m -s /bin/bash developer 
echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
chown -R developer:developer /home/developer
EOF

COPY <<EOF /post-create-script.sh
#!/bin/bash
bash /workspace/.scripts/print_packages.bash
EOF

RUN chmod +x /post-create-script.sh

USER developer


