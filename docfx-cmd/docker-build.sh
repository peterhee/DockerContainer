#!/bin/bash

user="pheese"
name="cmd-docfx"

case "$cpu" in
     "amd64" ) cpu="amd64";;
     *) cpu="arm64";;
esac


echo CPU Type $cpu

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker build -t docker.io/$user/$name:$cpu -f dockerfile.$cpu .
    # docker tag docker.io/$user/$name docker.io/$user/$name:$cpu
fi