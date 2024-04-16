#!/bin/bash

# Define your Docker Compose file name
COMPOSE_FILE="docker-compose.yml"

# Define the name of the Docker image
IMAGE_NAME="myreactapp"

# Shut down all containers running using Docker Compose
#docker-compose down
docker stop capstone_prod-my_service-1 || true


# Build the Docker image
docker build -t $IMAGE_NAME .




# Bring up containers using Docker Compose

docker-compose -f $COMPOSE_FILE up -d

