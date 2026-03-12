{ pkgs, ... }: {
  imports = [
    ./homebrew.nix
    ./system.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";

  # System-level packages (available to all users)
  environment.systemPackages = [ ];

  # Ensure zsh is available as login shell
  programs.zsh.enable = true;
}
