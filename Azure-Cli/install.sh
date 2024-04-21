#!/usr/bin/env bash

#
# Bash script to install the Azure CLI
#

install_script="/home/$1/scripts/install.py"
# chmod 775 $install_script
echo "Running install script."
python3 $install_script 
