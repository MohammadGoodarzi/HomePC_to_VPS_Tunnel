# ver5: Multiple forwand ports!

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
    create systemd service to auto start sh file
    $ sudo cp ./reverse-ssh-tunnel.sh /usr/local/bin/reverse-ssh-tunnel.sh &&
     sudo cp ./reverse-ssh.service /etc/systemd/system/reverse-ssh.service  &&
     sudo cp ./reverse-ssh.env  /etc/reverse-ssh.env 

    Make it executable:
    $ sudo chmod +x /usr/local/bin/reverse-ssh-tunnel.sh

    Start manually:
    $ sudo systemctl start reverse-ssh.service

    Stop it:
    $ sudo systemctl stop reverse-ssh.service

    Check status:
    $ sudo systemctl status reverse-ssh.service

    View logs:
    $ journalctl -u reverse-ssh.service -f


    Reload and Enable Service:
    $ sudo systemctl daemon-reload
    sudo systemctl enable reverse-ssh.service
    sudo systemctl start reverse-ssh.service
    
# RUN on Every Device to Connect:
    $ ssh -p 39191 homeuser@your.vps.ip.address



# After anychanges yo just need to run this command:  

   
    sudo cp reverse-ssh-tunnel.sh /usr/local/bin/reverse-ssh-tunnel.sh
    sudo chmod +x /usr/local/bin/reverse-ssh-tunnel.sh
    sudo cp reverse-ssh.env /etc/reverse-ssh.env
    sudo systemctl daemon-reload
    sudo systemctl restart reverse-ssh.service
    sudo systemctl status reverse-ssh.service
