#!/bin/bash
set -e
export DEBIAN_FRONTEND=noninteractive

echo ">>> Updating package index"
sudo apt-get update

echo ">>> Installing essential GUI and build tools"
sudo apt-get install -y --no-install-recommends \
  xfce4 xfce4-goodies lightdm lightdm-gtk-greeter \
  build-essential dkms linux-headers-$(uname -r)

echo ">>> Configuring LightDM"
sudo debconf-set-selections <<< 'lightdm shared/default-x-display-manager select lightdm'
sudo dpkg-reconfigure -f noninteractive lightdm

echo ">>> Installing VirtualBox Guest Additions"
sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 || true

echo ">>> Adjusting GUI permissions"
sudo sed -i 's/^allowed_users=.*/allowed_users=anybody/' /etc/X11/Xwrapper.config || true

echo ">>> Enabling GUI on boot"
sudo systemctl set-default graphical.target

echo ">>> Launching XFCE session"
nohup startxfce4 &>/dev/null &

echo ">>> Setup complete — GUI and Guest Additions installed."
