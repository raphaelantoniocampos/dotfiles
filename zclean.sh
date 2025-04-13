#!/bin/sh

sudo zypper packages --unneeded | grep "^i" > /tmp/unneeded_packages.txt
if [ -s /tmp/unneeded_packages.txt ]; then 
    cat /tmp/unneeded_packages.txt | cut -d '|' -f3 | xargs sudo zypper rm -y --clean-deps
else 
    echo "No unneeded packages found."
fi
