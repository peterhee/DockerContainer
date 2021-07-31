#!/bin/sh

set -e

# DOCFX_CMD=/opt/docfx/docfx.exe

# mono "$DOCFX_CMD" serve -p 8080 . 
nginx
sleep 5
docfx
docfx serve /source/_site 
