#!/bin/sh

# Handle bar clicks
if [ "$1" = "click" ]; then
    # Launches NetworkManager's visual menu in a floating terminal window
    swaymsg "exec foot --title='Wi-Fi Menu' nmtui"
    exit 0
fi


# Give PipeWire and NetworkManager a second to fully initialize
sleep 1

while true; do
    # 1. NetworkManager Wi-Fi Status
    wifi_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d: -f2)
    if [ -n "$wifi_ssid" ]; then
        network="   $wifi_ssid"
    else
        eth_status=$(nmcli device status | grep '^ethernet' | awk '{print $3}')
        if [ "$eth_status" = "connected" ]; then
            network="   Wired"
        else
            network="   Disconnected"
        fi
    fi

    # 2. PipeWire Volume Status
    if ! vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null); then
        volume="   --"
    elif echo "$vol_info" | grep -q "MUTED"; then
        volume="   Muted"
    else
        vol_val=$(echo "$vol_info" | awk '{print $2}')
        vol_perc=$(echo "$vol_val * 100" | bc 2>/dev/null | cut -d. -f1)
        if [ -z "$vol_perc" ]; then vol_perc="0"; fi

        if [ "$vol_perc" -eq 0 ]; then
            volume="   $vol_perc%"
        elif [ "$vol_perc" -lt 50 ]; then
            volume="   $vol_perc%"
        else
            volume="   $vol_perc%"
        fi
    fi

    # 3. Battery Status
    if [ -d /sys/class/power_supply/BAT0 ]; then
        bat_perc=$(cat /sys/class/power_supply/BAT0/capacity)
        bat_status=$(cat /sys/class/power_supply/BAT0/status)
        if [ "$bat_status" = "Charging" ]; then
            bat_icon="  "
        elif [ "$bat_perc" -le 15 ]; then
            bat_icon="  "
        else
            bat_icon="  "
        fi
        battery="$bat_icon$bat_perc%"
    else
        battery=""
    fi

    # 4. Brightness Status
    if command -v brightnessctl >/dev/null; then
        bright_perc=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
        brightness="   $bright_perc%"
    else
        brightness=""
    fi

    # 5. Date and Time Status
    datetime="   $(date +'%a %Y-%m-%d %H:%M')"

    # Final output line
    echo "$network |$volume |$battery |$brightness |$datetime "
    
    sleep 2
done
