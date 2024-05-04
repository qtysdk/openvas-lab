#!/bin/bash

# Set the desired directory
desired_dir="$HOME/gsad"

# Check if the current directory is the desired directory
if [ "$(pwd)" != "$desired_dir" ]; then
    echo "Current directory is not $desired_dir. Moving to $desired_dir..."
    cd "$desired_dir"
    if [ $? -ne 0 ]; then
        echo "Failed to move to $desired_dir. Exiting."
        exit 1
    fi
fi

# Set the tag name
tag_name="rebuild-gsad"

# Build the Docker image with the specified tag
docker build -f .docker/prod.Dockerfile . -t "$tag_name"

# Create a temporary container from the built image
container_id=$(docker create "$tag_name")

# Copy the gsad file from the container to the host
docker cp "$container_id:/usr/local/sbin/gsad" /tmp/gsad

# Remove the temporary container
docker rm "$container_id"

# Remove the image
docker rmi "$tag_name"