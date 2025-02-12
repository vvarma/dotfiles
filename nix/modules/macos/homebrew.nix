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
      "docker"
      "1password"
    ];
    brews = [
      "docker-compose"
      "bazelisk"
      "git-lfs"
      "aria2"
      "libiconv"
      "protobuf"
      "pkg-config"
      "librdkafka"
      {
        name = "xcodes";
        link = true;
      }
    ];
  };
}
