#!/bin/bash
# Astolfo Dots System Monitor
# Shows CPU/RAM/Network as ●○ indicators (10-dot scale)
#
# DEPENDENCIES: bc (install via: sudo pacman -S bc)
# HOW IT WORKS:
#   - Reads /proc/stat and /sys/class/net/* for real-time stats
#   - Converts percentages to dot patterns (● = used, ○ = free)
#   - Outputs pure dot strings for Waybar (no extra text)
#
# PLACE IN LINUX: ~/.config/waybar/scripts/
# MAKE EXECUTABLE: chmod +x ~/.config/waybar/scripts/dots_system.sh

MODE="$1"
UPDATE_INTERVAL=1

get_dots() {
  local value="$1"  # 0-100
  local total=10
  local filled=$(echo "scale=0; ($value * $total) / 100" | bc)
  local empty=$((total - filled))

  local dots=""
  for ((i=0; i<filled; i++)); do
    dots+="●"  # Filled dot
  done
  for ((i=0; i<empty; i++)); do
    dots+="○"  # Empty dot
  done
  echo "$dots"
}

case "$MODE" in
  cpu)
    while true; do
      # Calculate CPU usage percentage
      cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print int(usage)}')
      echo "$(get_dots $cpu)"
      sleep $UPDATE_INTERVAL
    done
    ;;
  memory)
    while true; do
      # Calculate RAM usage percentage
      mem=$(free | awk '/Mem:/ {printf "%d", $3/$2 * 100.0}')
      echo "$(get_dots $mem)"
      sleep $UPDATE_INTERVAL
    done
    ;;
  network)
    while true; do
      # Calculate combined RX/TX speed (KB/s)
      rx_pre=$(cat /sys/class/net/*/statistics/rx_bytes | paste -s '+')
      tx_pre=$(cat /sys/class/net/*/statistics/tx_bytes | paste -s '+')
      sleep 1
      rx_next=$(cat /sys/class/net/*/statistics/rx_bytes | paste -s '+')
      tx_next=$(cat /sys/class/net/*/statistics/tx_bytes | paste -s '+')
      rx_speed=$(( (rx_next - rx_pre) / 1024 ))  # KB/s
      tx_speed=$(( (tx_next - tx_pre) / 1024 ))
      total_speed=$((rx_speed + tx_speed))

      # Normalize to 0-100% (adjust 1000 for your max expected speed in KB/s)
      # Example: 1000 = 1MB/s max → 500KB/s = 50%
      percent=$(( (total_speed * 100) / 1000 ))
      [ $percent -gt 100 ] && percent=100
      echo "$(get_dots $percent)"
      sleep 1
    done
    ;;
esac