{ config, lib, ... }: {
  nix = {
    gc.automatic = true;
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      input-fonts.acceptLicense = true;
      joypixels.acceptLicense = true;
    };
  };

  services = { } // lib.attrsets.optionalAttrs (builtins.hasAttr "nix-daemon" config.services) {
    nix-daemon.enable = true;
  };

  imports = [ ../../overlay ];
}
