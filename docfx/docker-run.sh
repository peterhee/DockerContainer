#!/bin/bash

if [ -d $1 ]; then
    echo docker run -it -p 8080:80 -v $1:/source docker.io/pheese/generate-docfx
    docker run -it -p 8080:80 -v $1:/source docker.io/pheese/generate-docfx
else
    echo Directory $1 does not exist.
fi
