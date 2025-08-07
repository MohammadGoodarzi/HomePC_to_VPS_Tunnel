# ver2: get parameters from .rnv file

# Settings on Homelab:
    <!-- 192.168.10.114/24 brd 192.168.10.255 -->
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
    
# RUN on Homelab:
    $ chmod +x ./runHomelapToVpsTunell.sh
    $ ./runHomelapToVpsTunell.sh
    
# RUN on Every Device to Connect:
    $ ssh -p 39191 homeuser@your.vps.ip.address
