#!/usr/bin/env bash

#
# Bash script to install the Azure CLI
#

install_script='/root/scripts/install.py'
chmod 775 $install_script
echo "Running install script."
$python_cmd $install_script 
