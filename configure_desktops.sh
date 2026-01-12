#!/bin/bash
set -e

echo "Configuring 4 Virtual Desktops for Console UI..."
echo ""

# 1. Set number of virtual desktops to 4
echo "Setting desktop count to 4..."
kwriteconfig5 --file kwinrc --group Desktops --key Number 4
kwriteconfig5 --file kwinrc --group Desktops --key Rows 1

# 2. Name each desktop
echo "Naming desktops..."
kwriteconfig5 --file kwinrc --group Desktops --group 1 --key Name "Streaming"
kwriteconfig5 --file kwinrc --group Desktops --group 2 --key Name "Games"
kwriteconfig5 --file kwinrc --group Desktops --group 3 --key Name "Music"
kwriteconfig5 --file kwinrc --group Desktops --group 4 --key Name "AI & Social"

# 3. Configure desktop switching behavior (wrap around for gamepad navigation)
echo "Configuring desktop navigation..."
kwriteconfig5 --file kwinrc --group Windows --key RollOverDesktops true

# 4. Enable desktop grid effects for visual feedback
kwriteconfig5 --file kwinrc --group Plugins --key desktopgridEnabled true

# 5. Configure pager to show all desktops
kwriteconfig5 --file plasma-org.kde.plasma.desktop-appletsrc --group Containments --group 1 --group Applets --group 2 --group Configuration --group General --key showOnlyCurrentScreen false

# 6. Reconfigure KWin to apply changes
echo "Applying desktop configuration..."
qdbus6 org.kde.KWin /KWin reconfigure

echo ""
echo "✓ Desktop configuration complete"
echo ""
echo "Desktops configured:"
echo "  1. Streaming - Netflix, Prime, YouTube, Pluto, Tubi"
echo "  2. Games - RetroArch, Kodi, Jellyfin"
echo "  3. Music - YouTube Music, iHeartRadio"
echo "  4. AI & Social - Grok, Gemini, Discord, X"
echo ""
echo "Desktop switching:"
echo "  - Wraps around (Desktop 4 → Desktop 1)"
echo "  - Desktop grid enabled (visual navigation)"
echo ""
echo "Next: Configure gamepad shortcuts for desktop switching"
echo "  Ctrl+F1 = Desktop 1, Ctrl+F2 = Desktop 2, etc."
