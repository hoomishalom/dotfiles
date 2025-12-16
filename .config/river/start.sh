#!/bin/bash

# dbus
eval $(dbus-launch --sh-syntax)

# -- START Env Variables --

# Sets XDG_RUNTIME_DIR env variable and craetes the directory if needed
if [ -z "${XDG_RUNTIME_DIR}" ]; then
  export XDG_RUNTIME_DIR="/tmp/user/$(id -u)"
  mkdir -pm 0700 "${XDG_RUNTIME_DIR}"
fi

# Set chosen terminal
export TERMINAL=foot

# Env varibable for saving grim screenshots 
export GRIM_DEFAULT_DIR=/home/hoomi/screenshots/
export RECORDER_DEFAULT_DIR=/home/hoomi/screenrecs/

# Env variables for xdg environment 
export XDG_CURRENT_DESKTOP=river
export XDG_SESSION_TYPE=wayland

# Config cursor
export XCURSOR_THEME='Bibata-Modern-Ice'
export XCURSOR_SIZE=20

# Config dir
export CONFIG=/home/hoomi/.config/

# Fixes Ghidra
export _JAVA_AWT_WM_NONREPARENTING=1

# -- END Env Variables -- 

# WM, running it with dbus-run-session creates a private dbus session for river which fixed my xdg-desktop-portal problems
exec dbus-run-session river
# exec dbus-run-session niri
