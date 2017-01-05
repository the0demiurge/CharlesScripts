# /etc/profile.d/flatpak.sh - set XDG_DATA_DIRS

XDG_DATA_DIRS="${XDG_DATA_DIRS:-$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share/:/usr/local/share/:/usr/share/}"
export XDG_DATA_DIRS
