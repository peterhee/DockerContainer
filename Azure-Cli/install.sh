#!/usr/bin/env bash

#
# Bash script to install the Azure CLI
#

$USER=$1

if [ -z $USER ]; then
    install_script="/root/scripts/install.py"
else
    install_script="/home/$1/scripts/install.py"
fi
# chmod 775 $install_script
echo "Running install script."
python3 $install_script 
