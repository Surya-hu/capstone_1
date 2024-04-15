#!/bin/bash

# Define your Docker Compose file name
COMPOSE_FILE="docker-compose.yml"

# Define the name of the Docker image
IMAGE_NAME="myreactapp"

# Build the Docker image
docker build -t $IMAGE_NAME .

# Shut down all containers running using Docker Compose
docker rmi -f $(docker images -q)
docker rm -f $(docker ps -aq)
docker-compose -f $COMPOSE_FILE down

# Bring up containers using Docker Compose
docker-compose -f $COMPOSE_FILE up -d

