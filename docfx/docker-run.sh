#!/bin/bash

# Script parameter Directory of DocFX repository containing docfs.json.

user="pheese"
name="generate-docfx"

# Remove exting container
docker ps -a -q --filter "name=$name" | grep -q . && echo "Container $name found." \
    && docker stop $name | grep -q . && echo "Container $name stopped" \
    && docker rm -fv $name | grep -q . && echo "Container $name removed."

# Check if directory exists
if [ -d $1 ]; then
    # Exposes container on port 8080 (http://localhost:8080 to access website) 
    echo docker run -it --name $name -p 8080:80 -v $1:/source docker.io/$user/$name
    docker run -it --rm --name $name -p 8080:80 -v $1:/source docker.io/$user/$name
else
    echo Directory $1 does not exist.
fi
