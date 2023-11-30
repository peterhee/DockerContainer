#!/bin/bash

user="pheese"
name="azure-cli"

cpu="arm64"

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker build -t docker.io/$user/$name -f dockerfile.$cpu .
    docker tag docker.io/$user/$name docker.io/$user/$name:$cpu
fi
