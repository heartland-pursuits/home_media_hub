#!/bin/bash
set -e

echo "Installing console UI packages..."

# Install core packages
sudo apt install -y \
    antimicrox \
    chromium-browser \
    plasma-widgets-addons \
    kdeplasma-addons-data

# Check if Papirus already installed
if dpkg -l | grep -q papirus-icon-theme; then
    echo "Papirus already installed"
else
    echo "Installing Papirus icon theme..."
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo apt update
    sudo apt install -y papirus-icon-theme
fi

echo "Package installation complete"
