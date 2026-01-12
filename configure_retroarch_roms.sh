#!/bin/bash
# Configure RetroArch to use Batocera ROM library (network mount)

CONFIG_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch"
CONFIG_FILE="$CONFIG_DIR/retroarch.cfg"
ROM_DIR="/mnt/batocera-roms"

echo "Configuring RetroArch ROM directories..."
echo "ROM Source: $ROM_DIR (network mount, no local copying)"
echo ""

# Ensure config directory exists
mkdir -p "$CONFIG_DIR"

# Backup existing config
if [ -f "$CONFIG_FILE" ]; then
    cp "$CONFIG_FILE" "$CONFIG_FILE.backup.$(date +%Y%m%d-%H%M%S)"
    echo "✓ Config backed up"
else
    touch "$CONFIG_FILE"
    echo "✓ New config file created"
fi

# Set ROM directory paths
echo "Setting ROM directory paths..."

# Helper function to set or update config value
set_config_value() {
    local key="$1"
    local value="$2"
    if grep -q "^$key =" "$CONFIG_FILE"; then
        sed -i "s|^$key =.*|$key = \"$value\"|" "$CONFIG_FILE"
    else
        echo "$key = \"$value\"" >> "$CONFIG_FILE"
    fi
}

set_config_value "rgui_browser_directory" "$ROM_DIR"
set_config_value "content_directory" "$ROM_DIR"

# Verify configuration applied
echo ""
echo "Verifying configuration..."
grep -E "rgui_browser_directory|content_directory" "$CONFIG_FILE"

echo ""
echo "Configuration complete. RetroArch is now pointed at $ROM_DIR"
