#!/bin/bash
# Remove orphaned GNOME packages

echo "Removing orphaned GNOME theme and language packages..."
echo "These are not used by KDE Plasma or any active applications."
echo ""

# Remove GNOME packages
sudo apt remove -y \
    gnome-themes-extra-data \
    language-pack-gnome-en \
    language-pack-gnome-en-base

# Clean up orphaned dependencies
echo ""
echo "Cleaning up orphaned dependencies..."
sudo apt autoremove -y

# Verify removal
echo ""
echo "Verifying removal..."
echo "Remaining GNOME packages:"
dpkg -l | grep gnome || echo "No GNOME packages found"

echo ""
echo "Disk space:"
df -h / | tail -1

echo ""
echo "Cleanup complete."
