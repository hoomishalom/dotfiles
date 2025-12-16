#!/bin/sh


PIDFILE="/tmp/wf-recorder.pid"
# OUTFILE="$RECORDER_DEFAULT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').mp4"
OUTFILE="/home/hoomi/screenrecs/$(date +'%Y-%m-%d_%H-%M-%S').mp4"

if [ -f "$PIDFILE" ]; then
    # Stop recording
    kill "$(cat "$PIDFILE")" 
    rm -f "$PIDFILE"
    notify-send "Screen recording stopped"
else
    # Start recording
    wf-recorder -g "$(slurp)" -f "$OUTFILE" &
    echo $! > "$PIDFILE"
    notify-send "Screen recording started"
fi
