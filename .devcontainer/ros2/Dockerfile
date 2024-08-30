FROM osrf/ros:jazzy-desktop-full


ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Delete user if it exists in container (e.g Ubuntu Noble: ubuntu)
RUN if id -u $USER_UID ; then userdel `id -un $USER_UID` ; fi

# Create the user
RUN <<EOF
groupadd --gid $USER_GID $USERNAME 
useradd --uid $USER_UID --gid $USER_GID -m $USERNAME 
apt-get update 
apt-get install -y sudo 
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME 
chmod 0440 /etc/sudoers.d/$USERNAME
chown -R developer:developer /home/developer
EOF


RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3-pip
ENV SHELL /bin/bash


# # Install sudo
RUN <<EOF
apt-get update 
apt-get install -y sudo openssh-client
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



COPY <<EOF /post-create-script.sh
#!/bin/bash
bash /workspace/.scripts/print_packages.bash
EOF

RUN chmod +x /post-create-script.sh

# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME
CMD ["/bin/bash"]