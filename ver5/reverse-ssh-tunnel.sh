#!/bin/bash

set -a
[ -f /etc/reverse-ssh.env ] && source /etc/reverse-ssh.env
set +a

# Pass the entire set of reverse port mappings as a string
exec ssh -N ${PORT_FORWARDS} ${VPS_USER}@${VPS_HOST} -p ${VPS_PORT}
