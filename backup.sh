
echo "Backing up data from system to github"

cp --debug /etc/sway/*						etc/sway/
cp --debux /etc/xdg/swayimg/init.lua		etc/xdg/swayimg/init.lua
cp --debug /etc/xdg/waybar/*				etc/xdg/waybar/
cp --debug /etc/xdg/wofi/*					etc/xdg/wofi/
cp --debug /usr/share/backgrounds/sway/*	bg-pictures/
cp --debug /etc/waybar/* 					etc/waybar/
cp --debug /etc/runit/ctrlaltdel			etc/runit/
cp --debug /etc/sddm.conf					etc/sddm.conf

