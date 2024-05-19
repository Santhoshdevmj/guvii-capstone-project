#!/bin/bash

# Update package index
sudo apt-get update

# Install necessary packages
sudo apt-get install -y ca-certificates curl

# Create directory for Docker's GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
sudo apt-get update

# Install Docker packages
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo apt-get install docker-compose-plugin -y

# Check Docker status

sudo systemctl status docker

sudo usermod -aG docker jenkins

sudo systemctl restart jenkins

ls -l /var/run/docker.sock

sudo systemctl status docker
