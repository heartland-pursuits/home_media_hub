#!/bin/bash
# Remount Batocera ROM library via SSHFS (read-only)

echo "Remounting Batocera ROM library..."
echo "Source: root@192.168.1.114:/userdata/roms"
echo "Destination: /mnt/batocera-roms"
echo "Mode: Read-only network mount (no data copying)"
echo ""

# Check if already mounted
if mount | grep -q "/mnt/batocera-roms"; then
    echo "Already mounted. Unmounting first..."
    sudo fusermount -u /mnt/batocera-roms
fi

# Ensure mount point exists
sudo mkdir -p /mnt/batocera-roms

# Mount with read-only access
echo "Mounting (this may prompt for Batocera root password)..."
sudo sshfs root@192.168.1.114:/userdata/roms /mnt/batocera-roms \
    -o allow_other,ro,default_permissions

# Verify mount
echo ""
if mount | grep -q "/mnt/batocera-roms"; then
    echo "✓ Mount successful"
    echo ""
    echo "Available ROM systems:"
    ls -1 /mnt/batocera-roms/ | head -20
else
    echo "✗ Mount failed"
    echo "Check network connectivity to 192.168.1.114"
fi

echo ""
echo "Note: This mount will not persist after reboot."
echo "Re-run this script after system restarts."
