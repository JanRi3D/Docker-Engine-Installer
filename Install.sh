#!/bin/bash

# Docker Installation Script for Debian-based Systems

# Add Docker's official GPG key:
apt-get update
apt-get install -y ca-certificates curl gnupg

# Create the directory for keyrings (if it doesn't exist)
install -m 0755 -d /etc/apt/keyrings

# Download and save Docker GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set appropriate permissions for the key
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the Docker repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update Apt package lists with the new repository information
apt-get update

# Install Docker-related packages
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Script completed successfully
echo "Docker and related packages have been installed successfully."
