#!/bin/bash

user="pheese"
name="cmd-docfx"

# Build Docker Container
if [ -f dockerfile ]; then
    docker build -t docker.io/$user/$name .
    docker tag docker.io/$user/$name docker.io/$user/$name:arm64
fi
