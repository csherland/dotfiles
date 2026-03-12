{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    tmux
    git
    fzf
    fastfetch
    lazygit
    ripgrep
    fd
    eza
    bat
    zoxide
    starship
    btop
    ranger
    gh
  ];
}
