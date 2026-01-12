#!/bin/bash
# Remove duplicate system Kodi packages (keep Flatpak)

echo "Removing system-installed Kodi packages..."
echo "This will NOT affect your Flatpak Kodi installation."
echo ""

# Remove system Kodi packages
sudo apt remove -y \
    kodi \
    kodi-bin \
    kodi-data \
    kodi-repository-kodi \
    kodi-visualization-spectrum

# Clean up orphaned dependencies
echo ""
echo "Cleaning up orphaned dependencies..."
sudo apt autoremove -y

# Verify removal
echo ""
echo "Verifying removal..."
echo "System Kodi packages remaining (should be empty or 'rc' status only):"
dpkg -l | grep kodi

echo ""
echo "Flatpak Kodi (should still be present):"
flatpak list | grep -i kodi

echo ""
echo "Cleanup complete. Flatpak Kodi preserved."
