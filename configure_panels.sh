#!/bin/bash
# configure_panels.sh - KDE Plasma Panel Configuration
# Creates 3-panel design per user specifications
# - Top-Center: Virtual Desktop Pager
# - Top-Right: Power/Session + System Settings
# - Side-Left: 7 widgets (App Launcher, Activities, System Tray, Volume, Bluetooth, User Switcher, Notifications)

set -e

echo "Starting KDE Plasma panel configuration..."

# Backup current panel configuration
BACKUP_FILE=~/.config/plasma-org.kde.plasma.desktop-appletsrc.backup.$(date +%Y%m%d-%H%M%S)
cp ~/.config/plasma-org.kde.plasma.desktop-appletsrc "$BACKUP_FILE"
echo "✓ Backed up current panel configuration to: $BACKUP_FILE"

# JavaScript for panel creation via qdbus6
PANEL_SCRIPT=$(cat <<'EOF'
// Remove all existing panels
var allPanels = panels();
print("Removing " + allPanels.length + " existing panels...");
for (var i = 0; i < allPanels.length; i++) {
  allPanels[i].remove();
}

// PANEL 1: Top-Center (Virtual Desktop Pager)
print("Creating Panel 1: Top-Center (Virtual Desktop Pager)...");
var topCenter = new Panel();
topCenter.location = "top";
topCenter.alignment = "center";
topCenter.height = 44;
topCenter.hiding = "autohide";
topCenter.addWidget("org.kde.plasma.pager");

// PANEL 2: Top-Right (Power/Session + System Settings)
print("Creating Panel 2: Top-Right (Power/Session + System Settings)...");
var topRight = new Panel();
topRight.location = "top";
topRight.alignment = "right";
topRight.height = 44;
topRight.hiding = "autohide";
topRight.addWidget("org.kde.plasma.lock_logout");
topRight.addWidget("org.kde.krunner");

// PANEL 3: Side-Left (7 widgets for full control)
print("Creating Panel 3: Side-Left (7 widgets)...");
var leftPanel = new Panel();
leftPanel.location = "left";
leftPanel.alignment = "center";
leftPanel.width = 60;
leftPanel.hiding = "autohide";
leftPanel.addWidget("org.kde.plasma.kickoff");
leftPanel.addWidget("org.kde.plasma.activitypager");
leftPanel.addWidget("org.kde.plasma.systemtray");
leftPanel.addWidget("org.kde.plasma.volume");
leftPanel.addWidget("org.kde.plasma.bluetooth");
leftPanel.addWidget("org.kde.plasma.userswitcher");
leftPanel.addWidget("org.kde.plasma.notifications");

print("✓ All 3 panels created successfully");
EOF
)

echo "Executing panel creation script via qdbus6..."
qdbus6 org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "$PANEL_SCRIPT"

echo "✓ Panel configuration complete"

# Restart plasmashell to ensure changes take effect
echo "Restarting plasmashell to apply changes..."
killall plasmashell
sleep 2
kstart6 plasmashell &
sleep 3

echo ""
echo "════════════════════════════════════════════════════════════════"
echo "PANEL CONFIGURATION COMPLETE"
echo "════════════════════════════════════════════════════════════════"
echo ""
echo "Three panels created:"
echo "  1. Top-Center: Virtual Desktop Pager (auto-hide)"
echo "  2. Top-Right: Power/Session + System Settings (auto-hide)"
echo "  3. Side-Left: 7 widgets for full control (auto-hide)"
echo ""
echo "IMPORTANT: Plasmashell has been restarted."
echo ""
echo "If panels don't appear correctly:"
echo "  1. Log out and log back in"
echo "  2. Or run: killall plasmashell && kstart6 plasmashell &"
echo ""
echo "To test auto-hide behavior:"
echo "  - Move mouse to panel edges to reveal them"
echo "  - Move mouse away and they should hide after delay"
echo ""
echo "Backup saved to: $BACKUP_FILE"
echo "════════════════════════════════════════════════════════════════"
