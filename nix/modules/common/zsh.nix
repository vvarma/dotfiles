{ config, ... }: {
  programs.zsh.enable = true;
  home-manager.users.${config.user}.programs.zsh = {
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
