{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "Input" ];
        emoji = [ "JoyPixels" ];
      };
    };

    home.packages = with pkgs; [
      font-awesome
      input-fonts
      joypixels
      nerdfonts
      open-sans
    ];
  };
}
