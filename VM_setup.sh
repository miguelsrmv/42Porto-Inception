#!/bin/bash

# Update package lists and upgrade existing packages
sudo apt-get update && sudo apt-get upgrade -y

# Install necessary packages
sudo apt-get install -y make vim git hostsed docker.io

# Add the current user to the docker group to avoid using sudo
sudo usermod -aG docker $USER

echo "VM Setup done!"

sudo reboot now
