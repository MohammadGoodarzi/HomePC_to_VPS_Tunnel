#!/bin/bash

# Load variables from .env
set -a
source .env
set +a

# Optional: ask for password if not using key auth (not recommended)
# sshpass -p "$VPS_PASSWORD" ssh -o StrictHostKeyChecking=no ...

# Reverse SSH tunnel (assuming SSH keys are used)
ssh -N -R ${REMOTE_FORWARD_PORT}:localhost:${HOME_SSH_PORT} ${VPS_USER}@${VPS_HOST} -p ${VPS_PORT}
