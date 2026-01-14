#!/bin/bash
set -e

echo "Setting up desktop launchers for Console UI..."
echo ""

# Create desktop directories for each virtual desktop
mkdir -p ~/Desktop
mkdir -p ~/.local/share/applications

# Desktop 1: Streaming
echo "Creating Desktop 1 (Streaming) launchers..."

# Netflix PWA
cat > ~/.local/share/applications/netflix-pwa.desktop << NETFLIX_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Netflix
Icon=netflix
Exec=chromium-browser --app=https://www.netflix.com --class=Netflix
StartupNotify=true
Categories=AudioVideo;Video;Network;
Keywords=streaming;movies;tv;
NETFLIX_EOF

# Prime Video PWA
cat > ~/.local/share/applications/primevideo-pwa.desktop << PRIME_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Prime Video
Icon=amazon-prime-video
Exec=chromium-browser --app=https://www.amazon.com/Prime-Video/ --class=PrimeVideo
StartupNotify=true
Categories=AudioVideo;Video;Network;
Keywords=streaming;movies;tv;amazon;
PRIME_EOF

# YouTube PWA
cat > ~/.local/share/applications/youtube-pwa.desktop << YOUTUBE_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=YouTube
Icon=youtube
Exec=chromium-browser --app=https://www.youtube.com --class=YouTube
StartupNotify=true
Categories=AudioVideo;Video;Network;
Keywords=streaming;video;
YOUTUBE_EOF

# Pluto TV PWA
cat > ~/.local/share/applications/plutotv-pwa.desktop << PLUTO_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Pluto TV
Icon=video-television
Exec=chromium-browser --app=https://pluto.tv --class=PlutoTV
StartupNotify=true
Categories=AudioVideo;Video;Network;
Keywords=streaming;tv;live;
PLUTO_EOF

# Tubi PWA
cat > ~/.local/share/applications/tubi-pwa.desktop << TUBI_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Tubi
Icon=video-television
Exec=chromium-browser --app=https://tubitv.com --class=Tubi
StartupNotify=true
Categories=AudioVideo;Video;Network;
Keywords=streaming;movies;tv;
TUBI_EOF

# Desktop 2: Games
echo "Creating Desktop 2 (Games) launchers..."

# RetroArch
cat > ~/.local/share/applications/retroarch.desktop << RETRO_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=RetroArch
Icon=retroarch
Exec=retroarch
Categories=Game;Emulator;
Keywords=emulator;game;retro;
RETRO_EOF

# Kodi
cat > ~/.local/share/applications/kodi.desktop << KODI_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Kodi
Icon=kodi
Exec=kodi
Categories=AudioVideo;Video;Player;
Keywords=media;player;entertainment;
KODI_EOF

# Jellyfin PWA
cat > ~/.local/share/applications/jellyfin-pwa.desktop << JELLYFIN_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Jellyfin
Icon=jellyfin
Exec=chromium-browser --app=http://localhost:8096 --class=Jellyfin
StartupNotify=true
Categories=AudioVideo;Video;
Keywords=media;server;streaming;
JELLYFIN_EOF

# Desktop 3: Music
echo "Creating Desktop 3 (Music) launchers..."

# YouTube Music PWA
cat > ~/.local/share/applications/youtube-music-pwa.desktop << YTMUSIC_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=YouTube Music
Icon=multimedia-audio-player
Exec=chromium-browser --app=https://music.youtube.com --class=YouTubeMusic
StartupNotify=true
Categories=Audio;Music;Network;
Keywords=music;streaming;
YTMUSIC_EOF

# iHeartRadio PWA
cat > ~/.local/share/applications/iheartradio-pwa.desktop << IHEART_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=iHeartRadio
Icon=multimedia-audio-player
Exec=chromium-browser --app=https://www.iheart.com --class=iHeartRadio
StartupNotify=true
Categories=Audio;Music;Network;
Keywords=music;radio;streaming;
IHEART_EOF

# Desktop 4: AI & Social
echo "Creating Desktop 4 (AI & Social) launchers..."

# Grok PWA
cat > ~/.local/share/applications/grok-pwa.desktop << GROK_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Grok
Icon=applications-science
Exec=chromium-browser --app=https://x.com/i/grok --class=Grok
StartupNotify=true
Categories=Network;Chat;
Keywords=ai;chatbot;assistant;
GROK_EOF

# Gemini PWA
cat > ~/.local/share/applications/gemini-pwa.desktop << GEMINI_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Gemini
Icon=applications-science
Exec=chromium-browser --app=https://gemini.google.com --class=Gemini
StartupNotify=true
Categories=Network;Chat;
Keywords=ai;chatbot;assistant;google;
GEMINI_EOF

# Discord PWA
cat > ~/.local/share/applications/discord-pwa.desktop << DISCORD_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=Discord
Icon=discord
Exec=chromium-browser --app=https://discord.com/app --class=Discord
StartupNotify=true
Categories=Network;Chat;
Keywords=chat;voice;gaming;
DISCORD_EOF

# X (Twitter) PWA
cat > ~/.local/share/applications/x-pwa.desktop << X_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=X
Icon=twitter
Exec=chromium-browser --app=https://x.com --class=X
StartupNotify=true
Categories=Network;Social;
Keywords=social;twitter;x;
X_EOF

# ChatGPT PWA
cat > ~/.local/share/applications/chatgpt-pwa.desktop << CHATGPT_EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=ChatGPT
Icon=applications-science
Exec=chromium-browser --app=https://chat.openai.com --class=ChatGPT
StartupNotify=true
Categories=Network;Chat;
Keywords=ai;chatbot;assistant;openai;
CHATGPT_EOF

# Make all desktop files executable
chmod +x ~/.local/share/applications/*.desktop 2>/dev/null || true

# Update desktop database
update-desktop-database ~/.local/share/applications/ 2>/dev/null || true

echo ""
echo "✓ Desktop launchers created"
echo ""
echo "Desktop 1 (Streaming): Netflix, Prime Video, YouTube, Pluto TV, Tubi"
echo "Desktop 2 (Games): RetroArch, Kodi, Jellyfin"
echo "Desktop 3 (Music): YouTube Music, iHeartRadio"
echo "Desktop 4 (AI & Social): Grok, Gemini, Discord, X, ChatGPT"
echo ""
echo "Launchers available in Application Menu"
echo "To add to desktop: Right-click desktop > Add Widgets > Application Launcher"
echo ""
echo "Note: Place launchers on appropriate virtual desktops manually via KDE System Settings"
