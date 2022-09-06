# FROM node:current-slim

FROM ubuntu 

ARG VERSION

# ADD install-dependencies.sh /install-dependencies.sh

#     DEBIAN_FRONTEND=noninteractive \
#     TZ=Europe/Berlin \

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Berlin \
    apt-get install -y gconf-service libxext6 libxfixes3 libxi6 \
                          libxrandr2 libxrender1 libcairo2 libcups2 \
                          libdbus-1-3 libexpat1 libfontconfig1 libgcc1 \
                          libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 \
                          libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 \
                          libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 \
                          libxcursor1 libxdamage1 libxss1 libxtst6 libappindicator1 \
                          libnss3 libasound2 libatk1.0-0 libc6 ca-certificates \
                          fonts-liberation2 lsb-release xdg-utils wget libgbm-dev \
                          fonts-noto-color-emoji fonts-takao gcc gnupg curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add
RUN curl -sL https://deb.nodesource.com/setup_16.x | /bin/sh 

RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install yarn -y
    
RUN mkdir -p /data

RUN useradd -ms /bin/bash mermaidcli
USER mermaidcli
WORKDIR /home/mermaidcli
RUN yarn add @mermaid-js/mermaid-cli@$VERSION

ADD puppeteer-config.json  /puppeteer-config.json

WORKDIR /data

ENTRYPOINT ["/home/mermaidcli/node_modules/.bin/mmdc", "-p", "/puppeteer-config.json"]
CMD [ "--help" ]
# CMD [ "/bin/bash" ]
