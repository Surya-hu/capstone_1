#!/bin/bash

# Define Docker Hub credentials
#DOCKER_USERNAME="surya92kumaran"
#DOCKER_PASSWORD="dckr_pat_IT1AkkwQv5Cv9FH0Jf3v6SzfzDU"

# Define Docker Hub repositories
DEV_REGISTRY="surya92kumaran/dev_capstone"
PROD_REGISTRY="surya92kumaran/prod_capstone"

# Define the branch names
#DEV_BRANCH="dev"
#MAIN_BRANCH="main"

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
# Check the current branch and push images accordingly in prod
#current_branch=$(git rev-parse --abbrev-ref HEAD)
#echo $current_branch

if [[ $GIT_BRANCH == "origin/dev" ]]; then
    authenticate_docker_hub
    build_and_push_image 
elif [[ $GIT_BRANCH == "main" ]]; then
    authenticate_docker_hub
    build_and_push_image_prod
else
    echo "No action specified"
fi

