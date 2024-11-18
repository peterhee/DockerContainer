#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

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

UBUNTU_VERSION="22.04"
user="pheese"
name="cmd-docfx"
cpu=$(uname -m)

case "$cpu" in
     "x86_64" ) cpu="x64"
        tag="amd64"
        IMAGE_REPO=ubuntu
        ;;
     *) cpu="arm64"
        tag="arm64"
        IMAGE_REPO=arm64v8/ubuntu
        ;;
esac

check_os

echo CPU Type $cpu

# Build Docker Container
if [ -f dockerfile ]; then
    docker build -t docker.io/$user/$name:$tag --build-arg CPU=$cpu --build-arg IMAGE=$IMAGE_REPO --build-arg TAG=$UBUNTU_VERSION -f dockerfile .
fi
