#!/bin/bash

# Load from env file (optional)

set -a
[ -f /etc/reverse-ssh.env ] && source /etc/reverse-ssh.env
set +a


# Use key auth, no password prompt
ssh -N -R ${REMOTE_FORWARD_PORT}:localhost:${HOME_SSH_PORT} ${VPS_USER}@${VPS_HOST} -p ${VPS_PORT}
