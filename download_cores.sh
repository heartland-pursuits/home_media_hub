#!/bin/bash
set -e

# Detect Core Directory
# Prioritize Flatpak as it's the verified installation method
if [ -d "$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores" ]; then
    CORE_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores"
    echo "Detected Flatpak Core Directory: $CORE_DIR"
elif [ -d "$HOME/.config/retroarch/cores" ]; then
    CORE_DIR="$HOME/.config/retroarch/cores"
    echo "Detected System Core Directory: $CORE_DIR"
else
    # Fallback creation for Flatpak structure if missing
    CORE_DIR="$HOME/.var/app/org.libretro.RetroArch/config/retroarch/cores"
    mkdir -p "$CORE_DIR"
    echo "Created Flatpak Core Directory: $CORE_DIR"
fi

cd "$CORE_DIR"

# URLs for Libretro Buildbot (Linux x86_64)
BASE_URL="https://buildbot.libretro.com/nightly/linux/x86_64/latest"
CORES=(
    "nestopia_libretro.so.zip"
    "snes9x_libretro.so.zip"
    "genesis_plus_gx_libretro.so.zip"
    "mame2003_plus_libretro.so.zip"
)

echo "Starting core download to $CORE_DIR..."

for core_zip in "${CORES[@]}"; do
    echo "Downloading $core_zip..."
    if wget -q --show-progress "$BASE_URL/$core_zip"; then
        echo "Extracting $core_zip..."
        unzip -o -q "$core_zip"
        rm "$core_zip"
        echo "Successfully installed ${core_zip%.zip}"
    else
        echo "FAILED to download $core_zip"
    fi
done

echo "------------------------------------------------"
echo "Core installation complete."
ls -l *.so
