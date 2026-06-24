#!/bin/bash
# Astolfo Dots Volume Controller
# Shows volume level as ●●○○○○○○○○ (10-dot scale) + mute state
#
# DEPENDENCIES: pamixer (install via: sudo pacman -S pamixer)
# HOW IT WORKS:
#   - Uses pamixer to get volume/mute status
#   - Left/right click: adjust volume
#   - Middle click: toggle mute
#   - Always outputs dot pattern for Waybar
#
# PLACE IN LINUX: ~/.config/waybar/scripts/
# MAKE EXECUTABLE: chmod +x ~/.config/waybar/scripts/dots_volume.sh

STEP=5
NOTIFY_TIMEOUT=1500

get_volume_dot() {
  vol=$(pamixer --get-volume)
  muted=$(pamixer --get-mute)

  if [[ "$muted" == "true" ]]; then
    echo "○○○○○○○○○○"  # All empty when muted
    return
  fi

  # Convert volume (0-100) to 10 dots
  dots=$(echo "scale=0; $vol / 10" | bc)
  filled=""
  empty=""
  for ((i=0; i<10; i++)); do
    if [ $i -lt $dots ]; then
      filled+="●"
    else
      empty+="○"
    fi
  done
  echo "${filled}${empty}"
}

case "$1" in
  up)
    pamixer --increase $STEP
    notify-send -t $NOTIFY_TIMEOUT "Volume" "$(get_volume_dot)" -i audio-volume-medium
    ;;
  down)
    pamixer --decrease $STEP
    notify-send -t $NOTIFY_TIMEOUT "Volume" "$(get_volume_dot)" -i audio-volume-medium
    ;;
  mute)
    pamixer --toggle-mute
    notify-send -t $NOTIFY_TIMEOUT "Volume" "$(get_volume_dot)" -i audio-volume-muted
    ;;
  status)
    get_volume_dot
    ;;
esac