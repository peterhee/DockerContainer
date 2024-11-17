FROM node:alpine

RUN mkdir -p /data

WORKDIR /usr/app

RUN apk add chromium
RUN npm install @mermaid-js/mermaid-cli

ADD puppeteer-config.json  /puppeteer-config.json

WORKDIR /data

ENTRYPOINT ["/usr/app/node_modules/.bin/mmdc", "-p", "/puppeteer-config.json"]
CMD [ "--help" ]

# CMD [ "/bin/bash" ] 