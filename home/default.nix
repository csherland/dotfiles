{ pkgs, ... }: {
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
  ];

  home.stateVersion = "24.11";

  # Raw config files — placed as-is into ~/
  home.file = {
    ".config/nvim" = { source = ./dotfiles/nvim; recursive = true; };
    ".config/ghostty" = { source = ./dotfiles/ghostty; recursive = true; };
    ".config/sketchybar" = { source = ./dotfiles/sketchybar; recursive = true; };
    ".config/starship.toml".source = ./dotfiles/starship.toml;
    ".config/fastfetch" = { source = ./dotfiles/fastfetch; recursive = true; };
    ".aerospace.toml".source = ./dotfiles/aerospace.toml;
    ".tmux.conf".source = ./dotfiles/tmux.conf;
    ".tmux/renew_env.sh" = { source = ./dotfiles/tmux/renew_env.sh; executable = true; };
    ".tmux/yank.sh" = { source = ./dotfiles/tmux/yank.sh; executable = true; };
    ".tmux/tmux.remote.conf".source = ./dotfiles/tmux/tmux.remote.conf;
    ".vimrc".source = ./dotfiles/vimrc;
  };
}
