#!/bin/bash

# Define variables
DOCKER_IMAGE_NAME="guvii-capstone"
DOCKERFILE_PATH="Dockerfile"

# Build Docker image
docker build -t "$DOCKER_IMAGE_NAME" -f "$DOCKERFILE_PATH" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image '$DOCKER_IMAGE_NAME' built successfully."
else
  echo "Failed to build Docker image '$DOCKER_IMAGE_NAME'."
  exit 1
fi
