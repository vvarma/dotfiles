{ pkgs, ... }: {
  system = {
    keyboard = {
      remapCapsLockToControl = true;
      enableKeyMapping = true;
    };

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };

      dock = {
        enable-spring-load-actions-on-all-items = true;
        mouse-over-hilite-stack = true;
        autohide = true;

        mineffect = "genie";
        orientation = "left";
        show-recents = false;
        tilesize = 44;

        persistent-apps = [
          "${pkgs.alacritty}/Applications/Alacritty.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
        ];
      };

      finder = {
        FXPreferredViewStyle = "clmv";
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
      };

      LaunchServices.LSQuarantine = false;

      CustomUserPreferences = {
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.dock" = {
          magnification = true;
          largesize = 48;
        };
        "com.apple.finder" = {
          WarnOnEmptyTrash = false;
          FXDefaultSearchScope = "SCcf";
          FXPreferredViewStyle = "clmv";
        };
      };
    };
  };
}

