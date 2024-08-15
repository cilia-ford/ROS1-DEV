FROM ros:humble

# # Install sudo
RUN <<EOF
apt-get update 
apt-get install -y sudo openssh-client 
rm -rf /var/lib/apt/lists/*
EOF

# Create a non-root user called "developer" with sudo privileges
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R developer:developer /home/developer

RUN mkdir -p /home/developer/.ssh

COPY <<EOF /post-create-script.sh
#!/bin/bash

sudo apt update -y
rosdep update
sudo chmod +x /workspace/*.sh
echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc
source /opt/ros/humble/setup.bash
echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
echo -e "\$SSH_KEY" > /home/developer/.ssh/id_rsa && chmod 600 /home/developer/.ssh/id_rsa
EOF


RUN chmod +x /post-create-script.sh

USER developer


