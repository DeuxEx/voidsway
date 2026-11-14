INSTALLMODULES=(
	#the depos
	"void-repo-multilib"
	"void-repo-multilib-nonfree"
	"void-repo-nonfree"
	#my requirements
	"grimshot"
	"wofi"
	"xdg-desktop-portal-gtk"
	"xdg-user-dirs-gtk"
	"xf86-video-intel"
	"xorg-minimal"
	#reguirements sway
	"swayfx"
	"Waybar"
	"swayrbar"
	"wayland-utils"
	"swaylock"
	"swayidle"
	"wlogout"
	"wlroots"
	"wmenu"
	"wayland-pipewire-idle-inhibit"
 	#sway defaults
	"wayland-protocols"
	"pcre2"
	"scdoc"
	#for terminal
	"kde-baseapps"
 	#fonts
	"font-awesome6"
	"nerd-fonts-ttf" 
	"nerd-fonts-otf"
	"nerd-fonts" 
	"xorg-fonts"
)



for module in "${INSTALLMODULES[@]}"; do
	echo "installing..." "$module"
	xbps-install "$module"
done



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



# Skapa config-mappen för mime-appar om den inte finns
mkdir -p "$HOME/.config"

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

