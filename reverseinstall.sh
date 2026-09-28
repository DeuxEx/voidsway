xbps-install void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

xbps-install Waybar font-awesome6 foot grimshot sway swayrbar wayland-utils wofi xdg-desktop-portal-gtk xdg-user-dirs-gtk xf86-video-intel xorg-fonts xorg-minimal swaylock swayidle


mkdir -p /etc/sway
mkdir -p /etc/xdg/wofi
mkdir -p /etc/xdg/waybar
mkdir -p /etc/xdg/foot

cp etc/sway/config /etc/sway/config
cp etc/xdg/foot/foot.ini /etc/xdg/foot/foot.ini
cp etc/xdg/waybar/* /etc/xdg/waybar/
cp etc/xdg/wofi/* /etc/xdg/wofi/
cp etc/sway/status.sh /etc/sway/status.sh
