INSTALLMODULES=(
	"void-repo-multilib"			#depo
	"void-repo-multilib-nonfree"	#depo
	"void-repo-nonfree"				#depo
	"grimshot"						#snapshots
	"wofi"							#menu
	"gthumb"						#bildvisning
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
	"scdoc"							#tool for creating man pages
	"kitty"							#terminals
	"font-awesome6"					#fonts
	"nerd-fonts-ttf"				#fonts
	"nerd-fonts-otf"				#fonts
	"nerd-fonts"					#fonts
	"xorg-fonts"					#fonts
	"gtklock"						#lockscreen
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
	"/etc/xdg/gtklock"
	"/etc/xdg/kitty"
	"/etc/sway"
	"/etc/waybar"
	"/usr/share/backgrounds/sway"
	"$HOME/Pictures"
	"$HOME/.config"
)


for dir in "${CREATEDIRS[@]}"; do
	mkdir -p "$dir"
done



cp --debug	etc/sway/*	 			/etc/sway/
cp --debug	etc/xdg/waybar/* 		/etc/xdg/waybar/
cp --debug	etc/xdg/wofi/* 			/etc/xdg/wofi/
cp --debug	bg-pictures/*	 		/usr/share/backgrounds/sway/
cp --debug	etc/sddm.conf 			/etc/sddm.conf
cp --debug	etc/waybar/*		 	/etc/waybar/
cp --debug	etc/runit/*				/etc/runit/
cp --debug	etc/xdg/swayimg/*		/etc/xdg/swayimg/
cp --debug	etc/sddm.conf			/etc/sddm.conf
cp --debug  etc/xdg/gtklock/*		/etc/xdg/gtklock/
cp --debug	etc/xdg/kitty/*			/etc/xdg/kitty/


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

