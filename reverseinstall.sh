#the depos
xbps-install void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree

#my requirements
xbps-install grimshot wofi xdg-desktop-portal-gtk xdg-user-dirs-gtk xf86-video-intel xorg-minimal

#reguirements sway
xbps-install swayfx Waybar swayrbar wayland-utils swaylock swayidle wlogout wlroots wmenu wayland-pipewire-idle-inhibit

#sway defaults
xbps-install wayland-protocols pcre2 scdoc

#for terminal
xbps-install kde-baseapps

#fonts
xbps-install font-awesome6 nerd-fonts-ttf nerd-fonts-otf nerd-fonts xorg-fonts xorg-fonts


mkdir -p /etc/xdg
mkdir -p /etc/xdg/wofi
mkdir -p /etc/xdg/waybar
mkdir -p /etc/xdg/swayimg
mkdir -p /etc/sway
mkdir -p /etc/waybar
mkdir -p /usr/share/backgrounds/sway
mkdir -p $HOME/Pictures

cp etc/sway/config 			/etc/sway/config
cp etc/xdg/waybar/* 		/etc/xdg/waybar/
cp etc/xdg/wofi/* 			/etc/xdg/wofi/
cp etc/sway/status.sh 		/etc/sway/status.sh
cp bg-pictures/*	 		/usr/share/backgrounds/sway/
cp etc/sddm.conf 			/etc/sddm.conf
cp etc/sway/sddm-config 	/etc/sway/
cp etc/waybar/*		 		/etc/waybar/
cp etc/sway/swaylock.conf 	/etc/sway/swaylock.conf
cp etc/runit/*				/etc/runit/
cp etc/xdg/swayimg/*		/etc/xdg/swayimg/
cp etc/sddm.conf			/etc/sddm.conf
