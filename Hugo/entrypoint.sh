#!/bin/sh

# Hugo 
chown ${USER_ID}:${GROUP_ID} /site

hugo server --bind 0.0.0.0
