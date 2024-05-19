#!/bin/bash

# Update package manager
sudo apt update

sudo apt upgrade -y

# Install required dependencies
sudo apt install -y fontconfig openjdk-17-jre

# Verify Java installation
java -version

# Download Jenkins keyring
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to sources.list.d
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package manager
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y

# Enable Jenkins service
sudo systemctl enable jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Check Jenkins service status
sudo systemctl status jenkins
