#!/bin/bash

# Define file paths
SCRIPT_SRC="./reverse-ssh-tunnel.sh"
SERVICE_SRC="./reverse-ssh.service"
ENV_SRC="./reverse-ssh.env"

SCRIPT_DEST="/usr/local/bin/reverse-ssh-tunnel.sh"
SERVICE_DEST="/etc/systemd/system/reverse-ssh.service"
ENV_DEST="/etc/reverse-ssh.env"

# Copy files to their destinations
echo "Copying files..."
sudo cp "$SCRIPT_SRC" "$SCRIPT_DEST"
sudo cp "$SERVICE_SRC" "$SERVICE_DEST"
sudo cp "$ENV_SRC" "$ENV_DEST"

# Make the script executable
echo "Making script executable..."
sudo chmod +x "$SCRIPT_DEST"

# Reload systemd to recognize the new service
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable the service to start on boot
echo "Enabling service..."
sudo systemctl enable reverse-ssh.service

# Start the service
echo "Starting service..."
sudo systemctl start reverse-ssh.service

# Display status
echo "Service status:"
sudo systemctl status reverse-ssh.service

# # Tail logs (optional)
# echo "Tailing logs (Ctrl+C to exit)..."
# sudo journalctl -u reverse-ssh.service -f
