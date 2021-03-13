#/usr/bin/env bash

## Modified version of powermenu from https://github.com/adi1090x/rofi
## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="$HOME/.config/rofi/powermenu"

time=$(date +"%H:%M")

rofi_command="rofi -theme $dir/config"

# Options
shutdown="⏻"
reboot=""
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "$time" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        if [[ -f /usr/local/bin/i3lock-custom ]]; then
            i3lock-custom
        elif [[ -f /usr/bin/i3lock ]]; then
            i3lock
        elif [[ -f /usr/bin/betterlockscreen ]]; then
            betterlockscreen -l
        fi
        ;;
    $suspend)
        mpc -q pause
        amixer set Master mute
        systemctl suspend
        ;;
    $logout)
        if [[ "$DESKTOP_SESSION" == "i3" ]]; then
            i3-msg exit
        elif [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
            openbox --exit
        elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
            bspc quit
        fi
        ;;
esac
