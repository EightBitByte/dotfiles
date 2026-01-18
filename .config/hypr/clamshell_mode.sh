#!/bin/bash

# Give the system a moment to register the monitor change
# Sometimes this small delay is enough to fix the intermittent issue
sleep 0.5 

# Check for a connected HDMI or DP monitor
if [[ "$(hyprctl monitors)" =~ "\s(HDMI|DP)-[0-9A-Z-]+" ]]; then
  if [[ $1 == "open" ]]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
  else
    hyprctl keyword monitor "eDP-1,disable"
  fi
fi
