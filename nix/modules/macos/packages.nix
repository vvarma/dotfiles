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
    k9s
    brotli

    graphviz
    postgresql_17
    podman
    docker
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
    git
    glib
    go
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
    jq
    lazygit
    neovim
    process-compose
    pass
    nodejs_22
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
    taplo
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
