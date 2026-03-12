{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "uninstall";
      autoUpdate = true;
      upgrade = true;
    };
    taps = [
      "nikitabobko/tap"
    ];
    casks = [
      "ghostty"
      "aerospace"
      "spotify"
      "obsidian"
      "discord"
      "firefox"
      "1password"
      "tailscale-app"
      "font-hack-nerd-font"
      "font-sf-pro"
      "raycast"
    ];
  };
}
