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

USER_ID=$(id -u)
GROUP_ID=$(id -g)
USER_NAME=$USER
UBUNTU_VERSION="24.04"

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
        -n=*|--name=*)
        USER_NAME="${i#*=}"
        ;;
        -g=*|--gid=*)
        GROUP_ID="${i#*=}"
        ;;
        -v=*|--ubuntu-version=*)
        UBUNTU_VERSION="${i#*=}"
        ;;
        *)        
        echo "ERROR WRONG PARAMETER: $i"
        echo "*** Command line help ***"
        echo ' -u="{USER_ID}" or --uid="{USER_ID}"'
        echo ' -n="{USER_NAME}" or --name="{USER_NAME}"'
        echo ' -g="{GROUP_ID}" or --gid="{GROUP_ID}"'
        echo ' '
        echo 'Default: root user'
        echo ' '${0##*/}
        echo 'Example default: non-root user USER_ID="$USER_ID" GROUP_ID="$GROUP_ID"'
        echo ' '${0##*/} '-u="1001" -g="1001" -e'
        exit 1
        ;;
    esac
done

user="pheese"
name="mkdocs"
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
echo Current USER enabled: $userenabled

# Build Docker Container
if [ $userenabled = 1 ]; then
    echo USER ID: $USER_ID
    echo GROUP ID: $GROUP_ID
    echo USER NAME: $USER_NAME
    if [ -f dockerfile ]; then
        docker build -t docker.io/$user/$name:$tag --build-arg CPU=$cpu --build-arg IMAGE=$IMAGE_REPO --build-arg TAG=$UBUNTU_VERSION --build-arg UBUNTU_VERSION=$UBUNTU_VERSION --build-arg USER_ID=$USER_ID --build-arg USER_NAME=$USER_NAME --build-arg GROUP_ID=$GROUP_ID -f dockerfile .
    fi
else
    if [ -f dockerfile ]; then
        docker build -t docker.io/$user/$name:$tag --build-arg CPU=$cpu --build-arg IMAGE=$IMAGE_REPO --build-arg TAG=$UBUNTU_VERSION  --build-arg UBUNTU_VERSION=$UBUNTU_VERSION -f dockerfile .
    fi
fi