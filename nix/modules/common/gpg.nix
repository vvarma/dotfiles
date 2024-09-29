{ config, lib, pkgs, ... }: {
  home-manager.users.${config.user} = {
    programs.gpg = {
      enable = true;
      settings = {
        default-key = "04D7A219B0ABE4C2B62A5E654A2B758631E1FD91";
        keyserver = "hkps://keys.openpgp.org";
        keyserver-options = "auto-key-retrieve";
      };
      scdaemonSettings = {
        disable-ccid = true;
      };
    };

    services.gpg-agent = lib.mkIf pkgs.stdenv.isLinux {
      enable = true;
      enableSshSupport = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };

    home.file = lib.mkIf pkgs.stdenv.isDarwin {
      ".gnupg/gpg-agent.conf".text = ''
        enable-ssh-support
        pinentry-program ${lib.getExe pkgs.pinentry_mac}
      '';
    };
  };
}

