#!/bin/sh

# Ge tjänster en sekund vid uppstart
sleep 1

while true; do

    # 1. NetworkManager Wi-Fi / Ethernet Status
    # Använd en enda nmcli-anrop eller läs direkt
    if wifi_ssid=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | awk -F: '$1=="yes"{print $2}') && [ -n "$wifi_ssid" ]; then
        network="   $wifi_ssid"
    else
        eth_state=$(cat /sys/class/net/e*/operstate 2>/dev/null)
        if [ "$eth_state" = "up" ]; then
            network="   Wired"
        else
            network="   Disconnected"
        fi
    fi

    # 2. PipeWire Volume Status (Utan bc)
    if ! vol_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null); then
        volume="   --"
    elif echo "$vol_raw" | grep -q "MUTED"; then
        volume="   Muted"
    else
        # Omvandla t.ex. "Volume: 0.45" till "45%" med ren shell-matematik
        vol_num=$(echo "$vol_raw" | sed 's/[^0-9.]//g')
        # Multiplicera med 100 via shell
        vol_perc=$(awk -v v="$vol_num" 'BEGIN {printf "%.0f", v * 100}')
        [ -z "$vol_perc" ] && vol_perc="0"

        if [ "$vol_perc" -eq 0 ]; then
            volume="   0%"
        elif [ "$vol_perc" -lt 50 ]; then
            volume="   $vol_perc%"
        else
            volume="   $vol_perc%"
        fi
    fi

    # 3. Battery Status (Direkt från /sys utan externa kommandon)
    battery=""
    if [ -d /sys/class/power_supply/BAT0 ]; then
        read -r bat_perc < /sys/class/power_supply/BAT0/capacity 2>/dev/null
        read -r bat_status < /sys/class/power_supply/BAT0/status 2>/dev/null
        
        if [ "$bat_status" = "Charging" ]; then
            bat_icon=" "
        elif [ "${bat_perc:-0}" -le 15 ]; then
            bat_icon=" "
        else
            bat_icon=" "
        fi
        battery="$bat_icon$bat_perc% "
    fi

    # 4. Brightness Status (Läs direkt från /sys/class/backlight om det finns)
    brightness=""
    backlight_dir=$(ls -d /sys/class/backlight/* 2>/dev/null | head -n 1)
    if [ -n "$backlight_dir" ]; then
        read -r actual_b < "$backlight_dir/actual_brightness" 2>/dev/null
        read -r max_b < "$backlight_dir/max_brightness" 2>/dev/null
        if [ -n "$max_b" ] && [ "$max_b" -gt 0 ]; then
            bright_perc=$(( actual_b * 100 / max_b ))
            brightness="  $bright_perc% "
        fi
    fi

    # 5. Date and Time
    datetime="   $(date +'%a %Y-%m-%d %H:%M')"

    # Utskrift till swaybar
    #echo "$network |$volume $battery$brightness|$datetime "
    echo "Battery: $battery Brightness: $brightness "

    # 2 sekunders pausslinga
    sleep 2
done
