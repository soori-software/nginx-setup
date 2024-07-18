#!/bin/bash

# Check if running with root privileges, otherwise check if sudo is available
if [ "$EUID" -eq 0 ] || sudo -n true 2>/dev/null; then
    echo "Running with root privileges or sudo access"
else
    echo "Please run with root privileges or sudo"
    exit 1
fi

# Update the package index
sudo apt update

# Install Nginx
sudo apt install -y nginx

# Install ufw if it's not already installed
sudo apt install -y ufw

# Allow 'Nginx HTTP' through the firewall
sudo ufw allow 'Nginx HTTP'

# Allow OpenSSH through the firewall
sudo ufw allow OpenSSH

# Enable the firewall
sudo ufw --force enable

# Check the firewall status
sudo ufw status

# Output the Nginx version to confirm installation
nginx -v
