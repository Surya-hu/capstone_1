#!/bin/bash

# Define Docker Hub credentials
DOCKER_USERNAME="surya92kumaran"
DOCKER_PASSWORD="U2FsdGVkX1/hcvDU1xLbvW+MPXq5L4Y2OF2NpQv9fZw="

# Define Docker Hub repositories
DEV_REGISTRY="surya92kumaran/dev_capstone"
PROD_REGISTRY="surya92kumaran/prod_capstone"

# Define the branch names
DEV_BRANCH="dev"
MAIN_BRANCH="main"

# Function to authenticate with Docker Hub
authenticate_docker_hub() {
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
}

# Function to build and push Docker image to the specified registry
build_and_push_image() {
    local branch=$1
    local registry=$2

    echo "Building and pushing image to $registry"
    docker build -t "$registry:$branch" .
    docker tag "$registry:$branch" "$registry:latest"  # Tagging the image as "latest"
    docker push "$registry:$branch"
    docker push "$registry:latest"  # Pushing the "latest" tag
}

<<<<<<< HEAD
# Check the current branch and push images accordingly
current_branch="git rev-parse --abbrev-ref HEAD"
=======
# Check the current branch and push images accordingly in prod
current_branch="git rev-parse --abbrev-ref HEAD"
>>>>>>> origin

if [ "$current_branch" == "$DEV_BRANCH" ]; then
    authenticate_docker_hub
    build_and_push_image "$DEV_BRANCH" "$DEV_REGISTRY"
elif [ "$current_branch" == "$MAIN_BRANCH" ]; then
    authenticate_docker_hub
    build_and_push_image "$MAIN_BRANCH" "$PROD_REGISTRY"
else
    echo "No action specified for branch $current_branch"
fi

