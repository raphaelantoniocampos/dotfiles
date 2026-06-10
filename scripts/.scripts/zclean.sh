#!/bin/sh

echo "Removing unneeded packages"
echo "sudo zypper packages --unneeded"

UNNEEDED_PACKAGES_FILE="/home/raphaelac/.unneeded_packages.txt"

zypper packages --unneeded | grep "^i" > "$UNNEEDED_PACKAGES_FILE"
if [ -s "$UNNEEDED_PACKAGES_FILE" ]; then 
    cat "$UNNEEDED_PACKAGES_FILE" | cut -d '|' -f3 | xargs sudo zypper rm -y --clean-deps
else 
    echo "No unneeded packages found."
fi
