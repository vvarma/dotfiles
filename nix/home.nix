{ pkgs, ... }: {
  # This is required information for home-manager to do its job
  home = {
    stateVersion = "23.11";
    username = "vinayvarma";
    homeDirectory = "/Users/vinayvarma";
    packages = [
      pkgs.git
      pkgs.direnv
      pkgs.pyenv
      pkgs.neovim
      pkgs.fzf
      pkgs.lazygit
      pkgs.alacritty
      pkgs.zellij
      pkgs.rustup
      pkgs.go
    ];
    file.".config" = { source = ../dot-config; recursive = true; };
  };
  xdg.enable = true;
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
        vim = "nvim";
    };
    history = {
      size = 10000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "git-extras" "vi-mode" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "code-stats/code-stats-zsh"; tags=[ from:gitlab use:codestats.plugin.zsh ]; } # Simple plugin installation
      ];
    };

  };
}

