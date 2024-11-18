# Docker image file that describes an Ubuntu18.04 image with PowerShell installed from Microsoft APT Repo
# INTEL use Image Repo ubuntu
# ARM64 use Image Repo arm64v8/ubuntu
ARG IMAGE=arm64v8/ubuntu
ARG TAG=22.04

FROM ${IMAGE}:${TAG} AS installer-env

# Timezone
ARG TZDATA=Europe/Berlin

# Default user and group id
ARG USER_ID=1000 
ARG GROUP_ID=1000
ARG USER_NAME=user

# Define ENVs for Localization/Globalization
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    USER=${USER_NAME} \
    USER_ID=${USER_ID} \
    GROUP_ID=${GROUP_ID} \
    TZ=${TZDATA}
    # set a fixed location for the Module analysis cache

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Create directories
RUN mkdir -p /home/${USER_NAME}
RUN mkdir -p /data

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
        curl

# Prep install nodejs
RUN curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
RUN chmod +x /tmp/nodesource_setup.sh
RUN /tmp/nodesource_setup.sh
RUN rm -f /tmp/nodesource_setup.sh

# Install dependencies and clean up
RUN apt-get update -y \
    && apt-get install -y \
        nodejs \
        chromium-bsu\
    && apt-get install --no-install-recommends -y \
    locales

# Configure the locale
RUN echo 'LC_ALL="en_US.UTF-8"' >>/etc/default/locale \
    && echo 'LANG="en_US.UTF-8"'  >>/etc/default/locale \
    && locale-gen $LANG && update-locale

ADD puppeteer-config.json  /puppeteer-config.json

# Create user and group
RUN  if [ -z $(getent group ${GROUP_ID}) ]; then addgroup --gid ${GROUP_ID} ${USER_NAME}; fi
RUN  if [ -z $(getent passwd ${USER_ID}) ]; then adduser --disabled-password --gecos '' --uid ${USER_ID} --gid ${GROUP_ID} ${USER_NAME}; fi

# Set permissions
RUN chown -R ${USER_ID}:${GROUP_ID} /data
RUN chown -R ${USER_ID}:${GROUP_ID} /home/${USER_NAME}

# Install mermaid-cli
RUN ln -s /home/${USER_NAME}/node_modules/.bin/mmdc /usr/bin/mmdc
USER ${USER}
WORKDIR /home/${USER_NAME}
RUN npm install @mermaid-js/mermaid-cli@$VERSION

# Change to the data directory
WORKDIR /data

ENTRYPOINT ["mmdc", "-p", "/puppeteer-config.json"]
CMD [ "--help" ]
# CMD [ "/bin/bash" ]
