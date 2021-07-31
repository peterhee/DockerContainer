#!/bin/bash

if [ -f dockerfile ]; then
    docker build -t docker.io/pheese/generate-docfx .
fi
