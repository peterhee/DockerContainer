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
name="cmd-docfx"
cpu=$(uname -m)

case "$cpu" in
     "x86_64" ) cpu="amd64";;
     *) cpu="arm64";;
esac

check_os

echo CPU Type $cpu

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker push docker.io/$user/$name:$cpu
    # docker tag docker.io/$user/$name docker.io/$user/$name:$cpu
fi
