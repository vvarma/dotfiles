{
  system.activationScripts.preUserActivation.text = ''
    if ! xcode-select --version 2>/dev/null; then
      run xcode-select --install
    fi
    if ! /opt/homebrew/bin/brew --version 2>/dev/null; then
      run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  '';

  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      upgrade = true;
    };
    casks = [
      "bluesnooze"
      "clipy"
      "dmenu-mac"
      "docker"
      "firefox"
      "slack"
      "1password"
    ];
    brews = [
      "docker-compose"
      "bazelisk"
      "git-lfs"
      "aria2"
      {
        name = "xcodes";
        link = true;
      }
    ];
  };
}
