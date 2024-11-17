# Docker image file that describes an Ubuntu18.04 image with PowerShell installed from Microsoft APT Repo
# INTEL use Image Repo ubuntu
# ARM64 use Image Repo arm64v8/ubuntu
ARG IMAGE=ubuntu
ARG TAG=22.04

FROM ${IMAGE}:${TAG} AS installer-env

# Default argument when not provided in the --build-arg
ARG TZDATA=Europe/Berlin

# INTEL use x64 to get the Powershell installation files
# ARM use arm64 to get the Powershell installation files
ARG CPU=x64
ARG TAG=${TAG}

# Timezone
ARG TZDATA=Europe/Berlin

# Default user and group id
ARG USER_ID=1000 
ARG GROUP_ID=1000
ARG USER_NAME=user

# Set environment variables
ENV LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    TZ=${TZDATA}

# Create directories
RUN mkdir -p /home/${USER_NAME}

