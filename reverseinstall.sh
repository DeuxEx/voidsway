#the depos
xbps-install void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

#my requirements
xbps-install grimshot wofi xdg-desktop-portal-gtk xdg-user-dirs-gtk xf86-video-intel xorg-fonts xorg-minimal zenity

#reguirements
xbps-install foot sway swayrbar wayland-utils swaylock swayidle ironbar wlogout wlroots

#fonts
xbps-install font-awesome6 nerd-fonts-ttf nerd-fonts-otf nerd-fonts xorg-fonts



mkdir -p /etc/xdg/{wofi,waybar,foot}
mkdir -p /etc/{sway,waybar,ironbar}
mkdir -p /usr/share/backgrounds/sway


cp etc/sway/config /etc/sway/config
cp etc/xdg/foot/foot.ini /etc/xdg/foot/foot.ini
cp etc/xdg/waybar/* /etc/xdg/waybar/
cp etc/xdg/wofi/* /etc/xdg/wofi/
cp etc/sway/status.sh /etc/sway/status.sh
cp bg-pictures/* /usr/share/backgrounds/sway/
cp etc/sddm.conf /etc/sddm.conf
cp etc/sway/sddm-config /etc/sway/
cp etc/waybar/* /etc/waybar/
cp etc/sway/swaylock.conf /etc/sway/swaylock.conf
cp etc/ironbar/* /etc/ironbar/
