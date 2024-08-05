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
PS_VERSION="7.4.3"

userenabled=0
# parse commandline
for i in "$@"
do
    case $i in
        -e|--enable)
        userenabled=1
        ;;
        -u=*|--uid=*)
        USER_ID="${i#*=}"
        ;;
        -g=*|--gid=*)
        GROUP_ID="${i#*=}"
        ;;
        -p=*|--pwsh=*)
        PS_VERSION="${i#*=}"
        ;;
        *)
            echo "*** Command line help ***"
            echo Default: USER_ID=$USER_ID GROUP_ID=$GROUP_ID
            echo -e or --enable "To enable user in container"
            echo -u="{USER_ID}" or --uid="{USER_ID}"
            echo -g="{GROUP_ID}" or --gid="{GROUP_ID}"
            exit 1
        ;;
    esac
done

user="pheese"
name="azure-pwsh"
cpu=$(uname -m)

case "$cpu" in
     "x86_64" ) cpu="amd64";;
     *) cpu="arm64";;
esac

check_os

echo CPU Type $cpu
echo USER enabled: $userenabled

# Build Docker Container
if [ $userenabled = 1 ]; then
    if [ -f dockerfile.user.$cpu ]; then
        docker build -t docker.io/$user/$name:$cpu --build-arg USER_ID=$USER_ID --build-arg GROUP_ID=$GROUP_ID --build-arg PS_VERSION=$PS_VERSION -f dockerfile.user.$cpu .
    fi
else
    if [ -f dockerfile.$cpu ]; then
        docker build -t docker.io/$user/$name:$cpu --build-arg PS_VERSION=$PS_VERSION -f dockerfile.$cpu .
    fi
fi