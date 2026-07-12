#!/bin/bash

# netfri25/dotfiles
cleanup() {
    # cleanup
    CGROUP_PATH=$(grep "^0::" /proc/self/cgroup | cut -d: -f3)
    pids=$(cat /sys/fs/cgroup"$CGROUP_PATH"/cgroup.procs | tail -n +3 | tac)

    this_pid=$$

    for pid in $pids; do
        if [ "$pid" -ne "$this_pid" ]; then
            kill "$pid" 2>/dev/null || true
        fi
    done
}

trap cleanup EXIT

# dbus
eval "$(dbus-launch --sh-syntax)"

# -- START Env Variables --

# Set chosen terminal
export TERMINAL=foot

# Env varibable for saving grim screenshots 
export GRIM_DEFAULT_DIR=$HOME/screenshots/
export RECORDER_DEFAULT_DIR=$HOME/screenrecs/

# Env variables for xdg environment 
# export XDG_SESSION_TYPE=wayland

# Config cursor
export XCURSOR_THEME='Bibata-Modern-Ice'
export XCURSOR_SIZE=20

# Config dir
export XDG_CONFIG=$HOME/.config/

# Fixes Ghidra
export _JAVA_AWT_WM_NONREPARENTING=1

# nouveau
export LIBVA_DRIVER_NAME=nouveau

# makes nvim the manpager, for much easier movement
export MANPAGER="nvim +Man!"

# path
export PATH="$PATH:/opt/clangd_21.1.0/bin/:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:/opt/gf:/opt/jdtls-1.52.0/bin/"
export PATH="$PATH:$HOME/.npm-global/bin:$HOME/.linuxbrew/bin"
export PATH="/home/hoomi/.local/bin:$PATH"

# Sets nvim as the default git editor
export GIT_EDITOR=nvim

# Sets nvim as the default editor for many programs
export EDITOR=nvim

# Sets JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/default-jre

# flatpak applications
export XDG_DATA_DIRS=${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:/home/hoomi/.local/share/flatpak/exports/share

# -- END Env Variables -- 

pipewire &

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
            # export XDG_CURRENT_DESKTOP=$wm
            $wm
        fi
    else
        echo "Invalid option"
    fi
done
