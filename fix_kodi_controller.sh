#!/bin/bash
# Fix Kodi peripheral detection for 8BitDo Pro 2

echo "Stopping Kodi..."
pkill -f kodi.bin

echo "Removing peripheral cache..."
rm -rf ~/.var/app/tv.kodi.Kodi/config/kodi/userdata/peripheral_data/*

echo "Updating autostart to force X11..."
cat > ~/.config/autostart/kodi.desktop << 'EOF'
[Desktop Entry]
Type=Application
Exec=env GDK_BACKEND=x11 flatpak run tv.kodi.Kodi
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Kodi
Comment=Launch Kodi on startup (X11 mode)
EOF

echo "Restarting Kodi..."
flatpak run tv.kodi.Kodi &

echo ""
echo "Fix applied. Monitor controller detection:"
echo "  1. Check device: ls -la /dev/input/js0"
echo "  2. Check logs: grep -i 'joystick' ~/.var/app/tv.kodi.Kodi/config/kodi/temp/kodi.log"
echo "  3. In Kodi: Settings > System > Input > Configure attached controllers"
