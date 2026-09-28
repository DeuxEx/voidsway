#!/bin/sh

# Give PipeWire and NetworkManager a second to fully initialize
sleep 1

while true; do
    # 1. NetworkManager Wi-Fi Status
    wifi_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes:' | cut -d: -f2)
    if [ -n "$wifi_ssid" ]; then
        wifi_signal=$(nmcli -t -f active,bars dev wifi | grep '^yes:' | cut -d: -f2)
        network=" 📶 $wifi_ssid ($wifi_signal)"
    else
        eth_status=$(nmcli device status | grep '^ethernet' | awk '{print $3}')
        if [ "$eth_status" = "connected" ]; then
            network=" 🔌 Wired"
        else
            network=" ❌ Disconnected"
        fi
    fi
    

    # 2. PipeWire Volume Status (With error catching)
    if ! vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null); then
        # If wpctl fails to connect to pipewire, show a warning icon
        volume="   --"
    elif echo "$vol_info" | grep -q "MUTED"; then
        volume="   Muted"
    else
        vol_val=$(echo "$vol_info" | awk '{print $2}')
        vol_perc=$(echo "$vol_val * 100" | bc 2>/dev/null | cut -d. -f1)
        
        # Fallback if math fails
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
            bat_icon="⚡"
        else
            bat_icon="🔋"
        fi
        battery=" $bat_icon $bat_perc%"
    else
        battery=""
    fi

    # 4. Brightness Status
    if command -v brightnessctl >/dev/null; then
        bright_perc=$(brightnessctl -m | cut -d, -f4 | tr -d '%')
        brightness=" 💡 $bright_perc%"
    else
        brightness=""
    fi

    # Output to swaybar (Items will appear from right to left in this order)
    echo "$network |$volume |$battery |$brightness | 📅 $(date +'%Y-%m-%d %H:%M')"
    
    sleep 2
done
