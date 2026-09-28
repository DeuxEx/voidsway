#!/bin/sh

# 1. Get Battery Percentage (Change BAT0 if your system uses BAT1)
if [ -d /sys/class/power_supply/BAT0 ]; then
    bat_perc=$(cat /sys/class/power_supply/BAT0/capacity)
    bat_status=$(cat /sys/class/power_supply/BAT0/status)
    
    # Choose icon based on charging status
    if [ "$bat_status" = "Charging" ]; then
        bat_icon="⚡"
    else
        bat_icon="🔋"
    fi
    battery=" $bat_icon $bat_perc%"
else
    battery=""
fi

# 2. Get Brightness Percentage (Requires brightnessctl package)
if command -v brightnessctl >/dev/null; then
    bright_perc=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
    brightness=" 💡 $bright_perc%"
else
    brightness=""
