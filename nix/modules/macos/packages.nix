{ config, pkgs, ... }: {
  home-manager.users.${config.user}.home.packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      pyyaml
      # pynacl
      # pylint
      # tldextract
      # isort
      # black
      # pip
    ]))

    bash
    bat
    coreutils
    curl
    diffutils
    gawk
    gh
    gnugrep
    gnum4
    gnumake
    gnused
    gnutar
    gnutls
    just
    pinentry_mac
    kubelogin
    kubernetes-helm
    kubectl
    kubectx


    alacritty
    bfs
    delta
    dfrs
    doggo
    dos2unix
    dua
    editorconfig-core-c
    eza
    fd
    file
    fzf
    gcc
    git
    glib
    go
    jq
    lazygit
    neovim
    obsidian
    pass
    progress
    pwgen
    pyenv
    qrencode
    rsync
    rustup
    sipcalc
    socat
    sops
    sqlite
    tree
    unrar
    unzip
    w3m
    wireguard-tools
    zellij
    zip
    zsh
  ];
}
