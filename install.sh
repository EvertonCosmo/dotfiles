#!/bin/bash

echo "Symlinking ..."

ln -s $(pwd)/.gitconfig ~/.gitconfig 
ln -s $(pwd)/.zshrc ~/.zshrc  

echo "Applying another configurations ..."
if [ -e "/etc/X11/xorg.conf.d" ] 
then 
echo -e 'Section "Device"\n Identifier "Intel Graphics"\n Driver "Intel"\n Option "AccelMethod" "sna"\n Option "TearFree" "true"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/20-intel.conf
echo "Applied tearing solution configuration"
else 
echo "Creating directory Xorg.conf.d"
mkdir "/etc/X11/xorg.conf.d"
cp "20-intel.conf" "/etc/X11/xorg.conf.d/"
fi
if [ -e "/etc/sysctl.d" ]
then 
sudo cp "99-sysctl.conf" "/etc/sysctl.d/"
echo "swap file copied with sucess"
fi
