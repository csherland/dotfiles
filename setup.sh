#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing Nix (Determinate Systems installer)..."
if ! command -v nix &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
  echo "==> Please restart your shell, then re-run this script."
  exit 0
fi

echo "==> Installing Homebrew..."
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Building and activating nix-darwin + home-manager..."
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v darwin-rebuild &>/dev/null; then
  nix run nix-darwin -- switch --flake .
else
  darwin-rebuild switch --flake .
fi

echo "==> Done! Restart your shell to pick up all changes."
