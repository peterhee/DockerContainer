#!/bin/sh

set -e

# Start nginx server
nginx
sleep 5

# Compile DocFX Site
docfx docfx.json

# Host web site on port 80
if [ -d /source/_site ]; then
    docfx serve /source/_site 
else
    echo DocFX compilation error not _site directory creaated.
fi    
