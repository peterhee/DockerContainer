#!/bin/bash

check_os() {
    if [ $(uname) == "Darwin" ]; then
        echo "MacOS installed."
    elif [ $(uname) == "Linux" ]; then
        echo "Linux installed"
        # Only if pass is installed
        if which "pass" > /dev/null; then
            pass show docker-credential-helpers/docker-pass-initialized-check > /dev/null
        fi
    else
        echo "Error: Unknown operating system."
        exit 1
    fi
}

user="pheese"
name="azure-pwsh"
cpu=$1

case "$cpu" in
     "amd64" ) cpu="amd64";;
     *) cpu="arm64";;
esac

check_os

echo CPU Type $cpu

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker build -t docker.io/$user/$name:$cpu -f dockerfile.$cpu .
    # docker tag docker.io/$user/$name docker.io/$user/$name:$cpu
fi
