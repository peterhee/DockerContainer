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

USER_ID=$(id -u)
GROUP_ID=$(id -g)

# parse commandline
for i in "$@"
do
    case $i in
        -u=*|--uid=*)
        USER_ID="${i#*=}"
        ;;
        -g=*|--gid=*)
        GROUP_ID="${i#*=}"
        ;;
    *)
        echo "*** Command line help ***"
        echo Default: USER_ID=$USER_ID GROUP_ID=$GROUP_ID
        echo -u="{USER_ID}" or --uid="{USER_ID}"
        echo -g="{GROUP_ID}" or --gid="{GROUP_ID}"
        exit 1
    ;;
    esac
done

user="pheese"
name="mkdocs"
cpu=$(uname -m)

case "$cpu" in
     "x86_64" ) cpu="amd64";;
     *) cpu="arm64";;
esac

check_os

echo CPU Type $cpu
echo USER_ID: $USER_ID
echo GROUP_ID: $GROUP_ID

# Build Docker Container
if [ -f dockerfile.$cpu ]; then
    docker build -t docker.io/$user/$name:$cpu --build-arg USER_ID=$USER_ID --build-arg GROUP_ID=$GROUP_ID -f dockerfile.$cpu .
    # docker tag docker.io/$user/$name docker.io/$user/$name:$cpu
fi
