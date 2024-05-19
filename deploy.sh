#!/bin/bash

# Define variables
IMAGE_NAME="santhosh9790500644/guvii-capstone-dev"
TAG="latest"
SERVER_IP="13.201.83.147"
REMOTE_USER="ubuntu"
SSH_KEY="guvii.pem"

# SSH into the server and pull the Docker image
ssh -i $SSH_KEY $REMOTE_USER@$SERVER_IP << EOF
sudo docker pull $IMAGE_NAME:$TAG
sudo docker run -d --name guvii-capstone-dev -p 80:80 $IMAGE_NAME:$TAG
exit
EOF
