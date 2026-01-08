#!/bin/sh

echo "Distribution upgrade"
echo "sudo zypper refresh && sudo zypper dup --allow-vendor-change --recommends -y -l"
sudo zypper refresh && sudo zypper dup --allow-vendor-change -y -l
