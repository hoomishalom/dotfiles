#/bin/sh
grim -g "$(slurp)" - | tee "$GRIM_DEFAULT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png" | wl-copy -t image/png
