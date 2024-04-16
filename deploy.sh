#!/bin/bash


# Define Docker Hub repositories
DEV_REGISTRY="surya92kumaran/dev_capstone"
PROD_REGISTRY="surya92kumaran/prod_capstone"


# Function to authenticate with Docker Hub
authenticate_docker_hub() {
    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
}

# Function to build and push Docker image to the specified registry
build_and_push_image() {
    #local branch=$1
    #local registry=$2

    echo "Building and pushing image to $registry"
    docker build -t $DEV_REGISTRY .
    docker push $DEV_REGISTRY
}
build_and_push_image_prod() {
    #local branch=$1
    #local registry=$2

    echo "Building and pushing image to $registry"
    docker build -t $PROD_REGISTRY .
    docker push $PROD_REGISTRY
}


if [[ $GIT_BRANCH == "origin/dev" ]]; then
    authenticate_docker_hub
    build_and_push_image 
elif [[ $GIT_BRANCH == "origin/main" ]]; then
    authenticate_docker_hub
    build_and_push_image_prod
else
    echo "No action specified"
fi

