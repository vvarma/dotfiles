{ config, lib, ... }: {
  imports = [
    ./atuin.nix
    ./base-packages.nix
    ./bat.nix
    ./bottom.nix
    ./direnv.nix
    ./docker.nix
    ./firefox.nix
    ./fonts.nix
    #./git.nix
    #./gpg.nix
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
      file.".config" = { source = ../../../dot-config; recursive = true; };
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
