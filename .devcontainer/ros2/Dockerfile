FROM ros:humble

# Install sudo
RUN apt-get update && \
    apt-get install -y sudo openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user called "developer" with sudo privileges
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Ensure /home/developer/.ssh directory exists and add SSH configuration
RUN mkdir -p /home/developer/.ssh && \
    chown developer:developer /home/developer/.ssh && \
    echo "Host github.com" >> /home/developer/.ssh/config && \
    echo "  IdentityFile /run/secrets/ssh-key" >> /home/developer/.ssh/config

RUN echo "#!/bin/bash" >> /post-create-script.sh && \
    echo "sudo chown -R developer:developer ." >> /post-create-script.sh && \
    echo "rosdep update && sudo rosdep install --from-paths src --ignore-src -y"  >> /post-create-script.sh && \
    echo "echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc" >> /post-create-script.sh && \
    echo "source /opt/ros/humble/setup.bash" >> /post-create-script.sh

USER developer