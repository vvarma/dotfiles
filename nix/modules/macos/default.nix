{
  system.stateVersion = 5;

  imports = [
    ../common
    ./homebrew.nix
    ./packages.nix
    ./system.nix
    ./touch-id.nix
    ./users.nix
  ];
}
