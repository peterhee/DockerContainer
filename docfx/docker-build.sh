#!/bin/bash

user="peterhee"
name="generate-docfx"

# Build Docker Container
if [ -f dockerfile ]; then
    docker build -t docker.io/$user/$name .
fi
