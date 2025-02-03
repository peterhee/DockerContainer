#!/bin/sh

export PATH=$PATH:/home/$USER/.local/bin

# MKDOCS 
# chown ${USER_ID}:${GROUP_ID} /site

# Build Site
mkdocs build

# Run web server
mkdocs serve --dev-addr 0.0.0.0:8000


