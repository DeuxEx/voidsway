#!/bin/sh

#Lösning 2: Använd ett wrapper-skript
#Om du vill ha en renare Sway-konfiguration kan du skapa ett litet skript 
#(t.ex. ~/.config/sway/scripts/launch-waybar.sh):


# Stäng av eventuellt körande waybar-processer
killall -q waybar

# Vänta tills processerna har stängts ner helt
while pgrep -x waybar >/dev/null; do sleep 1; done

# Starta waybar
waybar -c /etc/waybar/config -s /etc/waybar/style.css &
