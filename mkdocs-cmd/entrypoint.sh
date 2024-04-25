#!/bin/sh

# MKDOCS 
chown ${USER_ID}:${GROUP_ID} /site

# Build Site
/home/$USER/.local/bin/mkdocs build

# Run web server
/home/$USER/.local/bin/mkdocs serve --dev-addr 0.0.0.0:8000


