#!/bin/bash

# dbus
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
  eval "$(dbus-launch --sh-syntax)"
fi

# -- START Env Variables --

# Set chosen terminal
export TERMINAL=foot

# Env varibable for saving grim screenshots 
export GRIM_DEFAULT_DIR=$HOME/screenshots/
export RECORDER_DEFAULT_DIR=$HOME/screenrecs/

# Env variables for xdg environment 
export XDG_SESSION_TYPE=wayland

# Config cursor
export XCURSOR_THEME='Bibata-Modern-Ice'
export XCURSOR_SIZE=20

# Config dir
export CONFIG=$HOME/.config/

# Fixes Ghidra
export _JAVA_AWT_WM_NONREPARENTING=1

# -- END Env Variables -- 

# list of possible compositors
compositors=(
    "river"
    "niri --session"
    "None"
)
# TODO: Maybe I should move this to a script later, not needed now
select wm in "${compositors[@]}"; do
    if [[ -n $wm ]]; then
        if [[ $wm == "None" ]]; then
            echo "No compositor selected"
            break
        else
            export XDG_CURRENT_DESKTOP=$wm
            dbus-run-session $wm
        fi
    else
        echo "Invalid option"
    fi
done
