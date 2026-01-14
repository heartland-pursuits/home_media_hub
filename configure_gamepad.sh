#!/bin/bash
set -e

echo "Configuring AntiMicroX gamepad profile for console UI..."
echo ""

# 1. Create AntiMicroX config directory
mkdir -p ~/.config/antimicrox

# 2. Create gamepad profile XML for desktop switching
cat > ~/.config/antimicrox/console-ui-profile.gamecontroller.amgp << 'PROFILE_EOF'
<?xml version="1.0" encoding="UTF-8"?>
<gamecontroller configversion="19" appversion="3.1.4">
    <sets>
        <set index="1">
            <name>Console UI Navigation</name>
            
            <!-- D-Pad: Desktop Switching -->
            <dpad index="1">
                <dpadbutton index="1">
                    <name>D-Pad Up: Desktop 1 (Streaming)</name>
                    <slots>
                        <slot>
                            <code>0x1000021</code> <!-- Ctrl -->
                            <code>0x43</code>      <!-- F1 -->
                        </slot>
                    </slots>
                </dpadbutton>
                <dpadbutton index="2">
                    <name>D-Pad Down: Desktop 3 (Music)</name>
                    <slots>
                        <slot>
                            <code>0x1000021</code> <!-- Ctrl -->
                            <code>0x45</code>      <!-- F3 -->
                        </slot>
                    </slots>
                </dpadbutton>
                <dpadbutton index="4">
                    <name>D-Pad Left: Desktop 4 (AI &amp; Social)</name>
                    <slots>
                        <slot>
                            <code>0x1000021</code> <!-- Ctrl -->
                            <code>0x46</code>      <!-- F4 -->
                        </slot>
                    </slots>
                </dpadbutton>
                <dpadbutton index="8">
                    <name>D-Pad Right: Desktop 2 (Games)</name>
                    <slots>
                        <slot>
                            <code>0x1000021</code> <!-- Ctrl -->
                            <code>0x44</code>      <!-- F2 -->
                        </slot>
                    </slots>
                </dpadbutton>
            </dpad>
            
            <!-- Left Stick: Arrow Keys -->
            <stick index="1">
                <name>Left Stick: Navigation</name>
                <stickbutton index="1">
                    <slots><slot><code>0x1000013</code></slot></slots> <!-- Up Arrow -->
                </stickbutton>
                <stickbutton index="2">
                    <slots><slot><code>0x1000015</code></slot></slots> <!-- Down Arrow -->
                </stickbutton>
                <stickbutton index="4">
                    <slots><slot><code>0x1000012</code></slot></slots> <!-- Left Arrow -->
                </stickbutton>
                <stickbutton index="8">
                    <slots><slot><code>0x1000014</code></slot></slots> <!-- Right Arrow -->
                </stickbutton>
            </stick>
            
            <!-- Face Buttons -->
            <button index="1">
                <name>A Button: Enter (Confirm)</name>
                <slots><slot><code>0x1000004</code></slot></slots> <!-- Enter -->
            </button>
            <button index="2">
                <name>B Button: Escape (Back)</name>
                <slots><slot><code>0x1000000</code></slot></slots> <!-- Escape -->
            </button>
            
            <!-- Start/Select -->
            <button index="8">
                <name>Start: Application Menu</name>
                <slots><slot><code>0x1000022</code></slot></slots> <!-- Meta/Super -->
            </button>
            <button index="7">
                <name>Select: Window Switcher</name>
                <slots>
                    <slot>
                        <code>0x1000023</code> <!-- Alt -->
                        <code>0x1000001</code> <!-- Tab -->
                    </slot>
                </slots>
            </button>
        </set>
    </sets>
</gamecontroller>
PROFILE_EOF

# 3. Set AntiMicroX to autostart with profile
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/antimicrox.desktop << AUTOSTART_EOF
[Desktop Entry]
Type=Application
Name=AntiMicroX Gamepad Mapper
Exec=antimicrox --hidden --profile ~/.config/antimicrox/console-ui-profile.gamecontroller.amgp
X-KDE-autostart-after=panel
AUTOSTART_EOF

chmod +x ~/.config/autostart/antimicrox.desktop

echo ""
echo "✓ AntiMicroX gamepad profile created"
echo "✓ Autostart configured"
echo ""
echo "Profile: ~/.config/antimicrox/console-ui-profile.gamecontroller.amgp"
echo ""
echo "Desktop Switching:"
echo "  D-Pad Up    = Ctrl+F1 (Streaming)"
echo "  D-Pad Right = Ctrl+F2 (Games)"
echo "  D-Pad Down  = Ctrl+F3 (Music)"
echo "  D-Pad Left  = Ctrl+F4 (AI & Social)"
echo ""
echo "Navigation:"
echo "  Left Stick = Arrow Keys"
echo "  A Button   = Enter"
echo "  B Button   = Escape"
echo "  Start      = Application Menu"
echo "  Select     = Alt+Tab (Window Switcher)"
echo ""
echo "Next: Connect gamepad and test mapping"
echo "Run: antimicrox (to test profile)"
