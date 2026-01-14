#!/bin/bash
# fix_desktop_launchers_CORRECT.sh - Complete corrective script for Media Hub desktop app misalignments
# Created by Claude (Ara) - 2026-01-13
# Fixes misalignments identified by Grok's scan (2026-01-12)

set -e  # Exit on any error

echo "========================================"
echo "Media Hub Desktop Launcher Corrections"
echo "========================================"
echo ""

# 1. Rename Desktop 3 from "Gaming" to "Games"
echo "[1/10] Renaming Desktop 3 from 'Gaming' to 'Games'..."
cp ~/.config/kwinrc ~/.config/kwinrc.backup.$(date +%Y%m%d-%H%M%S)
kwriteconfig6 --file kwinrc --group "Desktops" --group "3" --key "Name" "Games"
qdbus6 org.kde.KWin /KWin reconfigure
echo "  ✓ Desktop 3 renamed to 'Games'"
echo ""

# 2. Remove 6 misaligned .desktop files
echo "[2/10] Removing 6 misaligned .desktop files..."
rm -f ~/.local/share/applications/youtube-music.desktop
rm -f ~/.local/share/applications/iheart-radio.desktop
rm -f ~/.local/share/applications/jellyfin.desktop
rm -f ~/.local/share/applications/grok.desktop
rm -f ~/.local/share/applications/x.desktop
rm -f ~/.local/share/applications/chatgpt.desktop
echo "  ✓ Removed: youtube-music, iheart-radio, jellyfin, grok, x, chatgpt"
echo ""

# 3. Create Steam launcher
echo "[3/10] Creating Steam launcher..."
cat > ~/.local/share/applications/steam.desktop <<'EOF'
[Desktop Entry]
Name=Steam
Comment=Application for managing and playing games on Steam
Exec=/usr/bin/steam %U
Icon=steam
Terminal=false
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/steam.desktop
echo "  ✓ Created steam.desktop (regular mode, NO BPM)"

# 4. Create Xbox Cloud Gaming launcher
echo "[4/10] Creating Xbox Cloud Gaming launcher..."
cat > ~/.local/share/applications/xbox-cloud.desktop <<'EOF'
[Desktop Entry]
Name=Xbox Cloud Gaming
Comment=Play Xbox games via cloud streaming
Exec=chromium-browser --app=https://www.xbox.com/play
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/xbox-cloud.desktop
echo "  ✓ Created xbox-cloud.desktop"

# 5. Create EA App launcher (placeholder)
echo "[5/10] Creating EA App launcher (placeholder)..."
cat > ~/.local/share/applications/ea-app.desktop <<'EOF'
[Desktop Entry]
Name=EA App
Comment=EA games launcher (requires manual installation from ea.com)
Exec=echo "EA App not installed. Download from https://www.ea.com/ea-app"
Icon=applications-games
Terminal=true
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/ea-app.desktop
echo "  ✓ Created ea-app.desktop (requires manual install)"

# 6. Create Facebook Gaming launcher
echo "[6/10] Creating Facebook Gaming launcher..."
cat > ~/.local/share/applications/facebook-gaming.desktop <<'EOF'
[Desktop Entry]
Name=Facebook Gaming
Comment=Watch and stream games on Facebook
Exec=chromium-browser --app=https://www.facebook.com/gaming
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/facebook-gaming.desktop
echo "  ✓ Created facebook-gaming.desktop"

# 7. Create Kick launcher
echo "[7/10] Creating Kick launcher..."
cat > ~/.local/share/applications/kick.desktop <<'EOF'
[Desktop Entry]
Name=Kick
Comment=Live streaming platform for gamers
Exec=chromium-browser --app=https://kick.com
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/kick.desktop
echo "  ✓ Created kick.desktop"

# 8. Create YouTube Gaming launcher
echo "[8/10] Creating YouTube Gaming launcher..."
cat > ~/.local/share/applications/youtube-gaming.desktop <<'EOF'
[Desktop Entry]
Name=YouTube Gaming
Comment=Gaming content on YouTube
Exec=chromium-browser --app=https://www.youtube.com/gaming
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;
EOF
chmod +x ~/.local/share/applications/youtube-gaming.desktop
echo "  ✓ Created youtube-gaming.desktop"
echo ""

# 9. Create Elisa for Desktop 2 Media
echo "[9/10] Creating Elisa music player launcher..."
cat > ~/.local/share/applications/elisa.desktop <<'EOF'
[Desktop Entry]
Name=Elisa
Comment=KDE music player for local library playback
Exec=elisa %F
Icon=elisa
Terminal=false
Type=Application
Categories=AudioVideo;Audio;Player;Qt;KDE;
EOF
chmod +x ~/.local/share/applications/elisa.desktop
echo "  ✓ Created elisa.desktop"
echo ""

# 10. Create Google Calendar and Weather for Desktop 4
echo "[10/10] Creating Desktop 4 Assistant apps..."
cat > ~/.local/share/applications/google-calendar.desktop <<'EOF'
[Desktop Entry]
Name=Google Calendar
Comment=Manage your schedule
Exec=chromium-browser --app=https://calendar.google.com
Icon=x-office-calendar
Terminal=false
Type=Application
Categories=Office;Calendar;
EOF
chmod +x ~/.local/share/applications/google-calendar.desktop
echo "  ✓ Created google-calendar.desktop"

cat > ~/.local/share/applications/weather.desktop <<'EOF'
[Desktop Entry]
Name=Weather
Comment=Weather forecast from Weather.com
Exec=chromium-browser --app=https://weather.com
Icon=weather-clear
Terminal=false
Type=Application
Categories=Network;
EOF
chmod +x ~/.local/share/applications/weather.desktop
echo "  ✓ Created weather.desktop"
echo ""

# 11. Update existing Gemini.desktop to use --class=GeminiApp
echo "Updating Gemini launcher with --class=GeminiApp..."
if [ -f ~/.local/share/applications/gemini.desktop ]; then
    sed -i 's|Exec=chromium-browser --app=https://gemini.google.com|Exec=chromium-browser --app=https://gemini.google.com --class=GeminiApp|g' ~/.local/share/applications/gemini.desktop
    echo "  ✓ Updated gemini.desktop"
else
    echo "  ⚠ Gemini.desktop not found - will need manual creation"
fi
echo ""

# Update desktop database
update-desktop-database ~/.local/share/applications/ 2>/dev/null || true

echo ""
echo "======================================"
echo "Desktop Launcher Corrections Complete"
echo "======================================"
echo ""
echo "REMOVED (violate zero redundancy or not in design):"
echo "  - youtube-music.desktop (redundant - YouTube provides music)"
echo "  - iheart-radio.desktop (redundant - YouTube provides music)"
echo "  - jellyfin.desktop (not in user's design)"
echo "  - grok.desktop (not in Desktop 4 design)"
echo "  - x.desktop (not in Desktop 4 design)"
echo "  - chatgpt.desktop (not in Desktop 4 design)"
echo ""
echo "CREATED (missing from user's design):"
echo "  Desktop 3 (Games):"
echo "    - steam.desktop (regular mode, NO BPM)"
echo "    - xbox-cloud.desktop"
echo "    - ea-app.desktop (requires manual install)"
echo "    - facebook-gaming.desktop"
echo "    - kick.desktop"
echo "    - youtube-gaming.desktop"
echo "  Desktop 2 (Media):"
echo "    - elisa.desktop (KDE music player)"
echo "  Desktop 4 (Assistant):"
echo "    - google-calendar.desktop"
echo "    - weather.desktop"
echo ""
echo "UPDATED:"
echo "  - gemini.desktop (added --class=GeminiApp for KWin window rules)"
echo "  - Desktop 3 renamed from 'Gaming' to 'Games'"
echo ""
Keywords=media;player;jellyfin;
EOF
    echo "✓ Created Jellyfin Media Player (Flatpak) launcher"
fi

# Update desktop database
update-desktop-database "$DESKTOP_DIR" 2>/dev/null || true

echo ""
echo "Correction complete. Desktop launchers now point to verified Flatpak installations."