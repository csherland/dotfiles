#!/bin/bash

set -euo pipefail

cat <<EOF
  _________       __   ____ ___
 /   _____/ _____/  |_|    |   \______
 \_____  \_/ __ \   __\    |   /\____ \
 /        \  ___/|  | |    |  / |  |_> >>>>
/_______  /\___  >__| |______/  |   __/
        \/     \/               |__|

EOF

CONFIGS="cava dunst fastfetch pacseek hypr hypridle rofi tmux waybar yazi"
BACKUP_DIR="/home/christian/.config_backup"
LOCAL_BIN="/home/christian/.local/bin"
FONT_DIR="/home/christian/.local/share/fonts"
DOTS_DIR="/home/christian/hyprdots"

# echo "==> Backing up existing config files..."
# mkdir -p "$BACKUP_DIR"
# for dir in $CONFIGS; do
#   if [ -d "/home/christian/.config/$dir" ]; then
#     echo "=> Backing up $dir to $BACKUP_DIR"
#     cp -r "/home/christian/.config/$dir" "$BACKUP_DIR/$dir"
#     rm -rf "/home/christian/.config/$dir"
#   fi
# done
#
# echo "==> Copying new config files..."
# cp -r $CONFIGS "/home/christian/.config/"
#
# echo "==> Making Waybar and Rofi scripts executable..."
chmod +x /home/christian/.config/waybar/scripts/*
chmod +x /home/christian/.config/rofi/* || true

echo "==> Copying binaries..."
mkdir -p "$LOCAL_BIN"
cp -r bin/* "$LOCAL_BIN"
chmod +x "$LOCAL_BIN"/*

echo "==> Making scripts executable..."
chmod +x "$DOTS_DIR"/* || true

echo "==> Refreshing font cache..."
fc-cache -f -v

echo -e "\n✅ Base setup completed successfully!"

# Create wallpaper directory
echo "==> Creating wallpaper directory..."
mkdir -p ~/Pictures/Wallpaper

# Install yay if not already installed
if ! command -v yay &>/dev/null; then
  echo "==> Installing AUR package manager (yay)..."
  sudo pacman -S --needed git base-devel || {
    echo "❌ Failed to install base-devel"
    exit 1
  }
  git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si || {
    echo "❌ yay installation failed"
    exit 1
  }
  cd ~
else
  echo "✔️ yay is already installed."
fi

# Install useful packages from pacman and AUR
# echo "==> Installing core packages..."
# yay -S --noconfirm \
#   pacseek \
#   unzip \
#   eza \
#   acpi \
#   playerctl
#
# sudo pacman -S --noconfirm \
#   dunst \
#   libnotify \
#   waybar \
#   wl-clipboard \
#   xdg-desktop-portal-hyprland \
#   xdg-desktop-portal \
#   brightnessctl \
#   pavucontrol \
#   tmux \
#   slurp \
#   grim \
#   hyprlock \
#   pamixer
