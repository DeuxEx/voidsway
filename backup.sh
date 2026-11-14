
echo "Backing up data from system to github"

cp /etc/sway/*				etc/sway/
cp /etc/xdg/swayimg/init.lua		etc/xdg/swayimg/init.lua
cp /etc/xdg/waybar/*			etc/xdg/waybar/
cp /etc/xdg/wofi/*			etc/xdg/wofi/
cp /usr/share/backgrounds/sway/*	bg-pictures/
cp /etc/waybar/* 			etc/waybar/
cp /etc/runit/ctrlaltdel		etc/runit/
cp /etc/sddm.conf				etc/sddm.conf

