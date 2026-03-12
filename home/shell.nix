{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cp = "cp -i";
      mv = "mv -i";
      vim = "nvim";
      lgit = "lazygit";
      cat = "bat";
      ls = "eza";
      l = "eza --long -a";
      ll = "eza --long --git";
      la = "eza -A";
      gs = "git status";
      ga = "git add";
      gd = "git diff";
      gc = "git commit -m";
      gp = "git push";
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      XDG_CONFIG_HOME = "$HOME/.config";
      ZVM_INIT_MODE = "sourcing";
    };

    history = {
      size = 5000;
      path = "$HOME/.zsh_history";
      share = true;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
    };

    completionInit = "autoload -Uz compinit && compinit";

    initExtraFirst = ''
      # Run fastfetch if available
      if command -v fastfetch &>/dev/null; then
        fastfetch
      fi
    '';

    initExtra = ''
      # Set directory for zinit
      ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"

      # Download Zinit, if it's not there yet
      if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      fi

      # Load zinit
      source "''${ZINIT_HOME}/zinit.zsh"

      # Plugins (syntax-highlighting and autosuggestions handled by home-manager)
      zinit light jeffreytse/zsh-vi-mode
      zinit light Aloxaf/fzf-tab

      # OMZ snippets
      zinit snippet OMZL::git.zsh
      zinit snippet OMZP::git
      zinit snippet OMZP::sudo
      zinit snippet OMZP::docker
      zinit snippet OMZP::command-not-found

      zinit cdreplay -q

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu yes
      zstyle ':completion:*' fzf-search-display true
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
      zstyle ':completion:*:*:docker:*' option-stacking yes
      zstyle ':completion:*:*:docker-*:*' option-stacking yes

      # Shell integrations
      eval "$(starship init zsh)"
      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"

      # Keybinds
      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[w' kill-region

      # Extract function
      extract() {
        if [ -f $1 ]; then
          case $1 in
            *.tar.bz2) tar xjf $1 ;;
            *.tar.gz) tar xzf $1 ;;
            *.bz2) bunzip2 $1 ;;
            *.rar) unrar x $1 ;;
            *.gz) gunzip $1 ;;
            *.tar) tar xf $1 ;;
            *.tbz2) tar xjf $1 ;;
            *.tgz) tar xzf $1 ;;
            *.zip) unzip $1 ;;
            *.Z) uncompress $1 ;;
            *.7z) 7z x $1 ;;
            *.deb) ar x $1 ;;
            *.tar.xz) tar xf $1 ;;
            *.tar.zst) unzstd $1 ;;
            *) echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }

      # Auto attach or create tmux session when SSHing
      if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
        tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
      fi

      # Local overrides
      [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
    '';
  };
}
