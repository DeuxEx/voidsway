INSTALLMODULES=(
	"void-repo-multilib"			#depo
	"void-repo-multilib-nonfree"	#depo
	"void-repo-nonfree"				#depo
	"grimshot"						#snapshots
	"wofi"							#menu
	"xdg-desktop-portal-gtk"
	"xdg-user-dirs-gtk"
	"xf86-video-intel"
	"xorg-minimal"
	"swayfx"						#way with beauty effects
	"Waybar"						#waybar bar
	"swayrbar"						#protocol for sway/swaybar
	"wayland-utils"					#wayland utilities
	"swaylock"						#screenlock
	"swayidle"						#idle functions
	"wlogout"						#wayland logout menu
	"wlroots"						#wayland library
	"wmenu"							#menu
	"wayland-pipewire-idle-inhibit"
	"wayland-protocols"				#wayland protocols
	"pcre2"							#perl comp regex
	"scdoc"							#tool for creatingman pages
	"kde-baseapps"					#term konsole is in here
	"font-awesome6"					#fonts
	"nerd-fonts-ttf"				#fonts
	"nerd-fonts-otf"				#fonts
	"nerd-fonts"					#fonts
	"xorg-fonts"					#fonts
)


for module in "${INSTALLMODULES[@]}"; do
	echo "installing..." "$module"
	xbps-install "$module" -y
done



CREATEDIRS=(
	"/etc/xdg"
	"/etc/xdg/wofi"
	"/etc/xdg/waybar"
	"/etc/xdg/swayimg"
	"/etc/sway"
	"/etc/waybar"
	"/usr/share/backgrounds/sway"
	"$HOME/Pictures"
	"$HOME/.config"
)


for dir in "${CREATEDIRS[@]}"; do
	mkdir -p "$dir"
done



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



# Definiera alla vanliga bildtyper
MIME_TYPES=(
    "image/jpeg"
    "image/png"
    "image/gif"
    "image/webp"
    "image/bmp"
    "image/svg+xml"
    "image/avif"
    "image/heif"
    "image/tiff"
)

# Loopa igenom och sätt swayimg som standard för varje typ
for mime in "${MIME_TYPES[@]}"; do
    xdg-mime default swayimg.desktop "$mime"
done

