# ver3: connect to vps without pass (via ssh key)

# Settings on Homelab:

    install the SSh server on ubtunu:

    $ sudo apt update
    $ sudo apt install openssh-server
    $ sudo nano /etc/ssh/sshd_config

    find this line:
    Port 22

    comment that and add this:
    Port 39191

    $ sudo ufw allow 39191/tcp
    $ sudo systemctl restart ssh

# Settings on VPS:

    $ sudo nano /etc/ssh/sshd_config
    Ensure these options are set:
        GatewayPorts yes
        AllowTcpForwarding yes

    $ sudo systemctl restart ssh\


# setup ssh key to prevent asking for vps password 
    # Generate an SSH key
    $ ssh-keygen -t ed25519 -C "reverse_tunnel"
    # Copy the public key to the VPS:
    $ ssh-copy-id -p VPS_PORT VPS_USER@$VPS_HOST

# RUN on Homelab:
    $ chmod +x ./runHomelapToVpsTunell.sh
    $ ./runHomelapToVpsTunell.sh
    
# RUN on Every Device to Connect:
    $ ssh -p 39191 homeuser@your.vps.ip.address
