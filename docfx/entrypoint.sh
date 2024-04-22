#!/bin/sh

# set -e

# Start nginx server
nginx
sleep 5

# Compile DocFX Site
# docfx docfx.json

# Host web site on port 80
if [ -r /source/docfx.json ]; then
    docfx build /source/docfx.json --serve 
else
    echo DocFX compilation error /source/docfx.json not found.
fi    
