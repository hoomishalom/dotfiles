# makes nvim the manpager, for much easier movement
export MANPAGER="nvim +Man!"

# path
export PATH="$PATH:/opt/clangd_21.1.0/bin/:$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:/opt/gf"

# Sets nvim as the default git editor
export GIT_EDITOR=nvim

# Sets nvim as the default editor for many programs
export EDITOR=nvim

# Sets JAVA_HOME
export JAVA_HOME=JAVA_HOME=/usr/lib/jvm/default-jre

# flatpak applications
export XDG_DATA_DIRS=${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:/home/hoomi/.local/share/flatpak/exports/share

# starts river
if [[ -z "$SSH_CONNECTION" ]]; then
    ~/.config/scripts/start.sh
fi
