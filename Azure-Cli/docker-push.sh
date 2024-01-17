#!/bin/bash

user="pheese"
name="azure-cli"
cpu=$1

case "$cpu" in
     "amd64" ) cpu="amd64";;
     *) cpu="arm64";;
esac


echo CPU Type $cpu

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker push docker.io/$user/$name:$cpu
fi
