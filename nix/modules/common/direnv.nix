{ config, ... }: {
  home-manager.users.${config.user}.programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
