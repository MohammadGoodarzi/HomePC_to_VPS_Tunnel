# Settings on Homelab:
  
    install the SSh server on ubtunu:

    $ sudo apt update
    $ sudo apt install openssh-server
    $ sudo nano /etc/ssh/sshd_config

    find this line:
    Port 22

    comment that and add this:
    Port xxxx

    $ sudo ufw allow xxxx/tcp
    $ sudo systemctl restart ssh

# Settings on VPS:

    $ sudo nano /etc/ssh/sshd_config
    Ensure these options are set:
        GatewayPorts yes
        AllowTcpForwarding yes

    $ sudo systemctl restart ssh\
    
# RUN on Homelab:
    $ chmod +x ./runHomelapToVpsTunell.sh
    $ ./runHomelapToVpsTunell.sh
    
# RUN on Every Device to Connect:
    $ ssh -p xxxx homeuser@your.vps.ip.address
