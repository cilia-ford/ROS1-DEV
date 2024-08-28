FROM eprosima/vulcanexus:humble-desktop

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


# Create a non-root user called "developer" with sudo privileges
RUN useradd -m -s /bin/bash developer && \
    echo "developer ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R developer:developer /home/developer

COPY <<EOF /post-create-script.sh
#!/bin/bash
echo 'source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash' >> ~/.bashrc
bash /workspace/.scripts/print_packages.bash
EOF

RUN chmod +x /post-create-script.sh



COPY <<EOF /fastrtps_default_profiles.xml 

<?xml version="1.0" encoding="UTF-8" ?>
<profiles xmlns="http://www.eprosima.com/XMLSchemas/fastRTPS_Profiles">
    <participant profile_name="disable_multicast" is_default_profile="true">
        <rtps>
            <builtin>
                <metatrafficUnicastLocatorList>
                    <locator/>
                </metatrafficUnicastLocatorList>
                <initialPeersList>
                    <locator>
                        <udpv4>
                            <address>127.0.0.1</address>
                        </udpv4>
                    </locator>
                </initialPeersList>
            </builtin>
        </rtps>
    </participant>
</profiles>

EOF

USER developer


