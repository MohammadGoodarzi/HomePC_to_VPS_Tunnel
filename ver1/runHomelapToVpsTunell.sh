#!/bin/bash

# Configuration
VPS_USER="root"
VPS_HOST="000.000.000.000"
VPS_PORT=0000 # Change if your VPS SSH is on another port
REMOTE_FORWARD_PORT=xxxx # Port on VPS to expose your home PC

# Start the reverse SSH tunnel
ssh -N -R ${REMOTE_FORWARD_PORT}:localhost:xxxx ${VPS_USER}@${VPS_HOST} -p ${VPS_PORT}

