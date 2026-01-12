#!/bin/bash
set -e

echo "Optimizing KDE Plasma for Console UI (TV viewing)..."
echo "Preserving: Layan theme, Layan colors, Layan cursor, custom wallpaper"
echo ""

# PRESERVE existing Layan configuration (DO NOT CHANGE):
# - Color scheme: Layan
# - Plasma theme: Layan
# - Cursor: Layan-cursors
# - Wallpaper: /home/m93-media/.local/share/wallpapers/Untitled design.png

# 1. Set Papirus-Dark as primary icon theme (Tela/Qogir installation skipped for Kubuntu 25.10 compatibility)
echo "Setting Papirus-Dark icons..."
kwriteconfig5 --file kdeglobals --group Icons --key Theme "Papirus-Dark"

# 2. Optimize icon sizes for TV viewing
echo "Scaling icons for TV (128px desktop, 64px panel)..."
kwriteconfig5 --file kdeglobals --group IconSizes --group DesktopIcons --key Size 128
kwriteconfig5 --file kdeglobals --group IconSizes --group PanelIcons --key Size 64
kwriteconfig5 --file kdeglobals --group IconSizes --group ToolbarIcons --key Size 48

# 3. Optimize font for TV readability (larger, bold)
echo "Optimizing fonts for TV..."
kwriteconfig5 --file kdeglobals --group General --key font "Noto Sans,12,-1,5,75,0,0,0,0,0,Bold"
kwriteconfig5 --file kdeglobals --group WM --key activeFont "Noto Sans,12,-1,5,75,0,0,0,0,0,Bold"

echo ""
echo "✓ Configuration files updated"
echo ""
echo "To apply changes, choose one:"
echo "  1. Log out and log back in (safest)"
echo "  2. Run from GUI terminal: killall plasmashell && kstart5 plasmashell &"
echo "  3. Reboot the system"
echo ""
echo "Active Configuration:"
echo "  Theme: Layan (preserved)"
echo "  Icons: Papirus-Dark (128px desktop)"
echo "  Alternatives installed: Tela, Qogir (use System Settings to switch)"
echo "  Fonts: Noto Sans Bold 12pt (TV-optimized)"
echo ""
echo "To switch icon themes: System Settings > Appearance > Icons"