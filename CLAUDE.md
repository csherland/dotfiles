# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal dotfiles managed by [chezmoi](https://www.chezmoi.io/). Targets two platforms: **macOS (darwin)** and **Arch Linux**. The source of truth lives in `home/` and gets applied to `~` via chezmoi.

## Chezmoi Commands

```bash
chezmoi apply              # Apply all changes to home directory
chezmoi diff               # Preview what would change
chezmoi add ~/.<file>      # Add a new dotfile to source control
chezmoi edit ~/.<file>     # Edit a managed file (opens source copy)
chezmoi cd                 # cd into this source directory
chezmoi data               # Show template data (email, name, OS, etc.)
```

## Repository Layout

All managed files live under `home/`. Chezmoi uses naming conventions to control behavior:

- **`dot_`** prefix → maps to `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- **`.tmpl`** suffix → Go template, rendered with chezmoi data
- **`executable_`** prefix → file gets chmod +x on apply
- **`home/.chezmoidata/packages.yaml`** → Package lists for both platforms (brew/cask for macOS, pacman/yay for Arch)
- **`home/.chezmoiscripts/`** → Run scripts triggered by chezmoi (install packages, set macOS defaults, change shell)
- **`home/.chezmoitemplates/`** → Reusable template fragments (shared `ask_user`/`command_exists` helpers)
- **`home/.chezmoi.toml.tmpl`** → Prompts for git `email` and `name` on `chezmoi init`
- **`home/.chezmoiexternal.toml`** → External dependencies (currently: tmux plugin manager)
- **`home/.chezmoiignore`** → Files excluded from apply (neovim plugin dirs, repo metadata)

## Key Managed Configs

| Target path | Source file | Notes |
|---|---|---|
| `~/.zshrc` | `dot_zshrc` | Zinit plugin manager, starship prompt, fzf, zoxide |
| `~/.gitconfig` | `dot_gitconfig.tmpl` | Template — uses `{{ .email }}` and `{{ .name }}` |
| `~/.config/nvim/` | `dot_config/nvim/` | LazyVim-based neovim config (lazy.nvim plugin manager) |
| `~/.config/ghostty/` | `dot_config/ghostty/` | Terminal emulator config with catppuccin themes |
| `~/.tmux.conf` | `dot_tmux.conf` | TPM pulled via `.chezmoiexternal.toml` |
| `~/.aerospace.toml` | `dot_aerospace.toml` | macOS tiling window manager |
| `~/.config/hypr/` | `dot_config/hypr/` | Hyprland (Arch only) |
| `~/.config/waybar/` | `dot_config/waybar/` | Status bar for Hyprland |
| `~/.config/sketchybar/` | `dot_config/sketchybar/` | macOS menu bar replacement |
| `~/.config/zsh/` | `dot_config/zsh/` | Shell aliases, env vars, keybinds (sourced by `.zshrc`) |

## Platform Conditionals

Scripts and templates use `{{ if eq .chezmoi.os "darwin" }}` or `{{ if eq .chezmoi.osRelease.id "arch" }}` guards. When editing `.tmpl` files, preserve these conditionals.

## Adding Packages

Add to `home/.chezmoidata/packages.yaml` under the appropriate section (`darwin.brews`, `darwin.casks`, `arch.pacman`, `arch.yay`). The `run_onchange_*-install-packages.sh.tmpl` scripts will auto-install on next `chezmoi apply`.

## Shell Aliases (for reference)

`cz`=chezmoi, `vim`=nvim, `lgit`=lazygit, `ls`=eza, `cat`=bat, `gs`/`ga`/`gd`/`gc`/`gp` for common git operations.
