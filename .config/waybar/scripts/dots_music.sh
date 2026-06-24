#!/bin/bash
# Astolfo Dots Music Controller
# Shows: [⏮] [▶⏸] [⏭] as interactive dots
# Click left/right/middle on the widget to control playback

case "$BUTTON" in
  1)  # Left click - previous track
      playerctl previous
      notify-send -t 1000 "⏮ Previous" "$(playerctl metadata title 2>/dev/null || echo "No track")"
      ;;
  2)  # Middle click - play/pause
      playerctl play-pause
      status=$(playerctl status 2>/dev/null)
      if [[ "$status" == "Playing" ]]; then
        notify-send -t 1000 "▶ Playing" "$(playerctl metadata title 2>/dev/null || echo "Unknown")"
      else
        notify-send -t 1000 "⏸ Paused" "$(playerctl metadata title 2>/dev/null || echo "Unknown")"
      fi
      ;;
  3)  # Right click - next track
      playerctl next
      notify-send -t 1000 "⏭ Next" "$(playerctl metadata title 2>/dev/null || echo "No track")"
      ;;
esac

# Always output the dot status for Waybar display
player=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null || echo "No player")
status=$(playerctl status 2>/dev/null || echo "Stopped")

# Music dots: [PREV] [PLAY/PAUSE] [NEXT]
prev_dot="○"  # Empty if no player
if [[ "$player" != "No player" ]]; then
  prev_dot="●"
fi

if [[ "$status" == "Playing" ]]; then
  play_dot="●"  # Filled when playing
else
  play_dot="○"  # Empty when paused/stopped
fi

next_dot="○"   # Empty if no player
if [[ "$player" != "No player" ]]; then
  next_dot="●"
fi

echo "$prev_dot $play_dot $next_dot"