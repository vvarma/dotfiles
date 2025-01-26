{ config, lib, ... }: {
  imports = [
    ./atuin.nix
    ./base-packages.nix
    ./direnv.nix
    ./docker.nix
    ./fonts.nix
    ./firefox.nix
    ./gtk.nix
    ./nix-index.nix
    ./nix.nix
    ./ripgrep.nix
    ./zsh.nix
  ];

  config.home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${config.user}.home = {
      stateVersion = "24.05";
      ##file.".config" = { source = ../../../dot-config; recursive = true; };
      file.".config/zellij" = { source = ../../../dot-config/zellij; recursive = true; };
      file.".config/alacritty" = { source = ../../../dot-config/alacritty; recursive = true; };
    };
  };

  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };

    personal.enable = lib.mkEnableOption "Personal setup";
  };
}
